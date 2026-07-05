#!/usr/bin/env bash
# Compile the Catala specification to browser JavaScript.
# Output: web/_build/default/main.bc.js exporting globalThis.SanctaphraxLib.
set -euo pipefail
cd "$(dirname "$0")/.."
clerk test tests/ >/dev/null   # also materializes _build/libcatala
catala ocaml catala/professional_investor.catala_en -o web/professional_investor.ml
catala api_web catala/professional_investor.catala_en -o web/professional_investor_api_web.ml
cp _build/libcatala/ocaml/*.ml _build/libcatala/ocaml/*.mli web/
cp "$(opam var lib)/catala/runtime/jsoo/runtime_jsoo.ml" "$(opam var lib)/catala/runtime/jsoo/runtime_jsoo.mli" web/
rm -f web/catala_runtime.mli web/dates_calc.mli
cd web
dune build --profile release ./main.bc.js
node smoke.js
echo "bundle: $(wc -c < _build/default/main.bc.js | tr -d ' ') bytes raw, $(gzip -9 -c _build/default/main.bc.js | wc -c | tr -d ' ') gzipped"
