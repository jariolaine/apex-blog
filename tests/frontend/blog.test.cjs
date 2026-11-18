/** Application-level tests for the shipped public APEX Blog JavaScript. */
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const test = require('node:test');
const vm = require('node:vm');

const source = fs.readFileSync(
  path.join(__dirname, '../../applications/blog/shared-components/static-files/js/blog.js'),
  'utf8'
);

function loadBlog(overrides = {}) {
  const events = [];
  const $ = function (element) {
    if (element && element.attributes) {
      return { attr: (name) => element.attributes[name] };
    }
    if (element && element.id) {
      return { html: (value) => events.push(['label', element.id, value]) };
    }
    throw new Error('Unexpected jQuery input in application test');
  };
  $.extend = Object.assign;

  const apex = {
    jQuery: $,
    debug: { info() {} },
    server: {
      plugin: (id, data, options) => {
        events.push(['request', id, data]);
        options.success({ label: 'What is 3 + 4?' });
      }
    },
    util: {
      getTopApex: () => ({
        jQuery: (selector) => ({
          dialog: (...args) => events.push(['dialog', selector, ...args])
        })
      })
    }
  };

  const blog = {};
  const context = {
    window: { blog },
    blog,
    apex,
    $x: (id) => ({ id }),
    $v_CheckValueAgainst: (item, value) => item === 'P1_POST_ID' && value === '17',
    ...overrides
  };
  vm.runInNewContext(source, context, { filename: 'blog.js' });
  return { blog: context.window.blog, events };
}

test('math question retrieves the label using the configured APEX Ajax identifier', () => {
  const { blog, events } = loadBlog();
  blog.plugin.mathQuestionField.getQuestion({ ajaxIdentifier: 'AJAX_ABC', labelId: 'P1_MATH_LABEL' });
  assert.equal(events[0][0], 'request');
  assert.equal(events[0][1], 'AJAX_ABC');
  assert.deepEqual(events[1], ['label', 'P1_MATH_LABEL', 'What is 3 + 4?']);
});

test('dialog title is updated in the top APEX window', () => {
  const { blog, events } = loadBlog();
  blog.ui.setDialogTitle('Edit post');
  assert.deepEqual(events, [['dialog', '.ui-dialog-content', 'option', 'title', 'Edit post']]);
});

test('current list item clears previous selection and updates accessibility state', () => {
  const links = [
    { attributes: { 'data-item-id': '17', 'aria-current': 'false' }, classes: new Set() },
    { attributes: { 'data-item-id': '22', 'aria-current': 'page' }, classes: new Set(['is-current']) }
  ];

  function collection(selected) {
    return {
      get length() { return selected.length; },
      removeAttr(name) {
        selected.forEach((item) => { delete item.attributes[name]; });
        return this;
      },
      attr(name, value) {
        selected.forEach((item) => { item.attributes[name] = value; });
        return this;
      },
      closest(selector) {
        assert.equal(selector, 'li');
        return {
          removeClass: (name) => selected.forEach((item) => item.classes.delete(name)),
          addClass: (name) => selected.forEach((item) => item.classes.add(name))
        };
      },
      filter(predicate) {
        return collection(selected.filter((item) => predicate.call(item)));
      }
    };
  }
  const region = {
    find(selector) {
      assert.equal(selector, 'a[data-item-id]');
      return collection(links);
    }
  };
  const { blog } = loadBlog();
  blog.ui.setListCurrentItem(region, { pageItem: 'P1_POST_ID' });

  assert.equal(links[0].attributes['aria-current'], 'page');
  assert.equal(links[0].classes.has('is-current'), true);
  assert.equal(links[1].attributes['aria-current'], undefined);
  assert.equal(links[1].classes.has('is-current'), false);
});
