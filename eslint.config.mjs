// Initial baseline: correctness checks; no bulk reformat of checked-in assets.
export default [
  {
    files: ["applications/**/*.js"],
    ignores: ["**/*.min.js"],
    languageOptions: {
      ecmaVersion: "latest",
      sourceType: "script",
      globals: {
        window: "readonly",
        document: "readonly",
        console: "readonly",
        navigator: "readonly",
        apex: "readonly",
        jQuery: "readonly",
        $: "readonly",
        $v: "readonly",
        $x: "readonly",
        $v_CheckValueAgainst: "readonly"
      }
    },
    rules: {
      "no-unexpected-multiline": "error",
      "no-unreachable": "error",
      "no-constant-condition": "error",
      "valid-typeof": "error"
    }
  }
];
