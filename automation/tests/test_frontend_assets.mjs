/** Maintainer-only tests for the frontend build implementation (not make test). */
import assert from 'node:assert/strict';
import { mkdtemp, mkdir, readFile, rm, symlink, writeFile } from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { test } from 'node:test';
import { generateAssets, validateAssetManifest } from '../ci/build_assets.mjs';

const manifest = {
  less: [{
    source: 'frontend/less/style.less',
    output: 'applications/blog/shared-components/static-files/css/style.css'
  }],
  javascript: [{
    source: 'frontend/js/blog.js',
    output: 'applications/blog/shared-components/static-files/js/blog.js'
  }]
};
const compilers = {
  less: async () => 'div { color: red; }\n',
  css: async () => 'div{color:red}\n',
  js: async () => 'window.blog=1;\n'
};

async function fixture(t) {
  const root = await mkdtemp(path.join(os.tmpdir(), 'apex-assets-'));
  t.after(async () => rm(root, { recursive: true, force: true }));
  for (const dir of ['frontend/less', 'frontend/js',
    'applications/blog/shared-components/static-files/css',
    'applications/blog/shared-components/static-files/js',
    'applications/blog/shared-components/plugins/plugin/static-files']) {
    await mkdir(path.join(root, dir), { recursive: true });
  }
  await writeFile(path.join(root, 'frontend/assets.json'), JSON.stringify(manifest));
  await writeFile(path.join(root, 'frontend/less/style.less'), 'div {color: red;}');
  await writeFile(path.join(root, 'frontend/js/blog.js'), 'window.blog = 1;\n');
  const plugin = path.join(root,
    'applications/blog/shared-components/plugins/plugin/static-files/plugin.js');
  await writeFile(plugin, 'plugin original');
  return { root, plugin };
}

test('declared outputs only: reject plugin writes, traversal and duplicates', () => {
  assert.equal(validateAssetManifest(manifest).length, 2);
  for (const output of [
    'applications/blog/shared-components/plugins/plugin/static-files/plugin.js',
    'applications/blog/shared-components/static-files/css/../../bad.css',
    'applications/blog/shared-components/static-files/css/style.min.css'
  ]) {
    assert.throws(() => validateAssetManifest({ ...manifest,
      less: [{ source: 'frontend/less/style.less', output }]
    }));
  }
  assert.throws(() => validateAssetManifest({ ...manifest,
    less: [...manifest.less, ...manifest.less]
  }), /Duplicate/);
});

test('build stages all outputs, writes only declared application files', async (t) => {
  const { root, plugin } = await fixture(t);
  const result = await generateAssets({ root, compilers });
  assert.equal(result.count, 4);
  assert.equal(result.updated.length, 4);
  assert.equal(await readFile(path.join(root,
    'applications/blog/shared-components/static-files/css/style.css'), 'utf8'),
    'div { color: red; }\n');
  assert.equal(await readFile(path.join(root,
    'applications/blog/shared-components/static-files/css/style.min.css'), 'utf8'),
    'div{color:red}\n');
  assert.equal(await readFile(path.join(root,
    'applications/blog/shared-components/static-files/js/blog.js'), 'utf8'),
    'window.blog = 1;\n');
  assert.equal(await readFile(path.join(root,
    'applications/blog/shared-components/static-files/js/blog.min.js'), 'utf8'),
    'window.blog=1;\n');
  assert.equal(await readFile(plugin, 'utf8'), 'plugin original');
  const again = await generateAssets({ root, compilers });
  assert.deepEqual(again.updated, []);
  assert.deepEqual(await generateAssets({ root, check: true, compilers }),
    { count: 4, updated: [] });
});

test('check mode reports stale files without changing tracked outputs', async (t) => {
  const { root } = await fixture(t);
  const file = path.join(root,
    'applications/blog/shared-components/static-files/js/blog.js');
  await writeFile(file, 'old output');
  await assert.rejects(generateAssets({ root, check: true, compilers }),
    /Generated frontend assets are out of date; run make assets/);
  assert.equal(await readFile(file, 'utf8'), 'old output');
});

test('compiler failures do not partially overwrite existing outputs', async (t) => {
  const { root } = await fixture(t);
  const file = path.join(root,
    'applications/blog/shared-components/static-files/css/style.css');
  await writeFile(file, 'original');
  await assert.rejects(generateAssets({ root, compilers: {
    ...compilers, js: async () => { throw new Error('Invalid JavaScript'); }
  } }), /Invalid JavaScript/);
  assert.equal(await readFile(file, 'utf8'), 'original');
});

test('generated outputs may not redirect through symlinks', async (t) => {
  const { root } = await fixture(t);
  const outside = await mkdtemp(path.join(os.tmpdir(), 'apex-assets-outside-'));
  t.after(async () => rm(outside, { recursive: true, force: true }));
  const target = path.join(root,
    'applications/blog/shared-components/static-files/js/blog.js');
  await symlink(path.join(outside, 'foreign.js'), target);
  await assert.rejects(generateAssets({ root, compilers }), /Symlink asset output/);
});
