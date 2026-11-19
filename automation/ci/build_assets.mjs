/** Compile application-owned LESS and JavaScript into APEXLang static files.
 *
 * The manifest in frontend/assets.json is editable application configuration;
 * plugin files are deliberately excluded and are never discovered automatically.
 */
import { execFileSync } from 'node:child_process';
import { readFile, lstat, mkdir, rename, unlink, writeFile } from 'node:fs/promises';
import { dirname, extname, isAbsolute, join, relative, resolve, sep } from 'node:path';
import { fileURLToPath } from 'node:url';
import { randomUUID } from 'node:crypto';

const ROOT = resolve(dirname(fileURLToPath(import.meta.url)), '../..');
const STATIC_ROOTS = [
  'applications/blog/shared-components/static-files/',
  'applications/blog-admin/shared-components/static-files/'
];

function run(command, args, input) {
  try {
    return execFileSync(command, args, {
      input,
      encoding: 'utf8',
      maxBuffer: 32 * 1024 * 1024,
      stdio: ['pipe', 'pipe', 'pipe']
    });
  } catch (error) {
    const detail = error.stderr?.toString() || error.message;
    throw new Error(`${command} failed: ${detail}`, { cause: error });
  }
}

const DEFAULT_COMPILERS = {
  less: (file) => run('lessc', ['--no-color', file]),
  css: (css) => run('esbuild', [
    '--loader=css', '--minify', '--charset=utf8',
    '--target=chrome100,firefox102,safari15'
  ], css),
  js: (js) => run('esbuild', [
    '--loader=js', '--minify-syntax', '--minify-whitespace',
    '--charset=utf8', '--target=es2020', '--legal-comments=inline'
  ], js)
};

function safeRelativeName(name, prefix, extension) {
  if (typeof name !== 'string' || !name.startsWith(prefix) ||
      isAbsolute(name) || name.includes('\\') || name.split('/').includes('..') ||
      extname(name) !== extension || name.includes('/plugins/')) {
    throw new Error(`Unsafe or unsupported frontend asset path: ${name}`);
  }
  return name;
}

function minified(output) {
  return output.replace(/\.(css|js)$/, '.min.$1');
}

/** Pure configuration check; no generated-file writes or compiler invocation. */
export function validateAssetManifest(manifest) {
  if (!manifest || !Array.isArray(manifest.less) ||
      !Array.isArray(manifest.javascript)) {
    throw new Error('frontend/assets.json needs less and javascript arrays');
  }
  const outputs = new Set();
  const entries = [];
  for (const [kind, extension, outputDir] of [
    ['less', '.less', 'css/'],
    ['javascript', '.js', 'js/']
  ]) {
    for (const entry of manifest[kind]) {
      if (!entry || typeof entry !== 'object') {
        throw new Error(`Invalid ${kind} entry`);
      }
      const source = safeRelativeName(entry.source,
        kind === 'less' ? 'frontend/less/' : 'frontend/js/', extension);
      const output = safeRelativeName(entry.output, 'applications/',
        kind === 'less' ? '.css' : '.js');
      if (!STATIC_ROOTS.some((root) => output.startsWith(root + outputDir))) {
        throw new Error(`Output must be an application ${outputDir} static file: ${output}`);
      }
      if (output.endsWith('.min.css') || output.endsWith('.min.js')) {
        throw new Error(`Output must be the unminified name: ${output}`);
      }
      for (const file of [output, minified(output)]) {
        if (outputs.has(file)) throw new Error(`Duplicate asset output: ${file}`);
        outputs.add(file);
      }
      entries.push({ kind, source, output });
    }
  }
  if (entries.length === 0) throw new Error('No application frontend assets configured');
  return entries;
}

async function assertNoSymlinks(root, filename) {
  // A writable checkout must not redirect an output through a symlink.
  let item = dirname(resolve(root, filename));
  while (item !== root && relative(root, item) !== '..') {
    try {
      const info = await lstat(item);
      if (info.isSymbolicLink()) throw new Error(`Symlink in asset path: ${item}`);
    } catch (error) {
      if (error.code !== 'ENOENT') throw error;
    }
    const parent = dirname(item);
    if (parent === item) break;
    item = parent;
  }
  try {
    const info = await lstat(resolve(root, filename));
    if (info.isSymbolicLink()) throw new Error(`Symlink asset output: ${filename}`);
  } catch (error) {
    if (error.code !== 'ENOENT') throw error;
  }
}

/** Collect every output before writing any tracked file. */
export async function generateAssets({ root = ROOT, check = false,
  compilers = DEFAULT_COMPILERS } = {}) {
  root = resolve(root);
  const manifest = JSON.parse(await readFile(resolve(root, 'frontend/assets.json'), 'utf8'));
  const entries = validateAssetManifest(manifest);
  const generated = new Map();
  for (const { kind, source, output } of entries) {
    const sourceFile = resolve(root, source);
    const plain = kind === 'less' ? await compilers.less(sourceFile)
      : await readFile(sourceFile, 'utf8');
    generated.set(output, Buffer.from(plain, 'utf8'));
    const optimized = kind === 'less' ? await compilers.css(plain)
      : await compilers.js(plain);
    generated.set(minified(output), Buffer.from(optimized, 'utf8'));
  }
  // Check every path before updating the first file.
  for (const filename of generated.keys()) await assertNoSymlinks(root, filename);
  const stale = [];
  for (const [filename, bytes] of generated) {
    let existing;
    try {
      existing = await readFile(resolve(root, filename));
    } catch (error) {
      if (error.code !== 'ENOENT') throw error;
    }
    if (!existing || !existing.equals(bytes)) stale.push(filename);
  }
  if (check) {
    if (stale.length) {
      throw new Error(`Generated frontend assets are out of date; run make assets:\n${stale.map((x) => `  ${x}`).join('\n')}`);
    }
    return { count: generated.size, updated: [] };
  }
  // Write only changed outputs. Temporary files are created alongside outputs
  // so replacement via rename is atomic for each file on the same filesystem.
  for (const filename of stale) {
    const dest = resolve(root, filename);
    await mkdir(dirname(dest), { recursive: true });
    const temporary = join(dirname(dest), `.${filename.split('/').at(-1)}.${randomUUID()}.tmp`);
    try {
      await writeFile(temporary, generated.get(filename));
      await rename(temporary, dest);
    } finally {
      await unlink(temporary).catch((error) => {
        if (error.code !== 'ENOENT') throw error;
      });
    }
  }
  return { count: generated.size, updated: stale };
}

if (process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const check = process.argv.length === 3 && process.argv[2] === '--check';
  if (process.argv.length > (check ? 3 : 2)) {
    console.error('Usage: node automation/ci/build_assets.mjs [--check]');
    process.exitCode = 2;
  } else {
    generateAssets({ check }).then(({ count, updated }) => {
      console.log(`[apex-blog] ${check ? 'Verified' : 'Generated'} ${count} application frontend assets`);
      for (const name of updated) console.log(`  updated ${name}`);
    }).catch((error) => {
      console.error(`[apex-blog] ${error.message}`);
      process.exitCode = 1;
    });
  }
}
