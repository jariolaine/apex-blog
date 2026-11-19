/** Application contract: editable JavaScript sources match deployed non-minified files. */
const assert = require('node:assert/strict');
const { readFileSync } = require('node:fs');
const path = require('node:path');
const test = require('node:test');

const root = path.resolve(__dirname, '../..');
const assets = JSON.parse(readFileSync(path.join(root, 'frontend/assets.json'), 'utf8'));

test('application JavaScript sources are mirrored in APEXLang static files', () => {
  for (const { source, output } of assets.javascript) {
    assert.equal(
      readFileSync(path.join(root, source), 'utf8'),
      readFileSync(path.join(root, output), 'utf8'),
      `${output} must be regenerated from ${source}`
    );
  }
});

test('frontend asset mapping excludes independently developed plugin files', () => {
  for (const { source, output } of [...assets.less, ...assets.javascript]) {
    assert.equal(source.startsWith('frontend/'), true);
    assert.equal(output.includes('/plugins/'), false);
    assert.equal(output.includes('/shared-components/static-files/'), true);
  }
});

test('the RSS stylesheet retains XML namespace declarations', () => {
  for (const ext of ['css', 'min.css']) {
    const rss = readFileSync(path.join(root,
      `applications/blog/shared-components/static-files/css/rss.${ext}`), 'utf8');
    assert.match(rss, /@namespace content\b/);
    assert.match(rss, /@namespace dc\b/);
  }
});
