# phrax

Formal specification of financial regulations using [Catala](https://catala-lang.org).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Try it in the browser:** [The Statute That Compiles](https://alticc.io/essays/the-statute-that-compiles) — a Luxembourg fund-law fragment you can run, with the essay explaining why.

## What is phrax?

phrax translates legal text into executable, testable code. It takes EU financial directives (AIFMD, MiFID II, RAIF Law) and encodes them in Catala—a language designed to mirror the structure of legislation.

The result: specifications you can typecheck, test, and compile to OCaml or Python.

## Installation

```bash
# Install opam (OCaml package manager)
brew install opam      # macOS
# or: sudo apt install opam   # Ubuntu/Debian

# Initialize opam
opam init
eval $(opam env)

# Install Catala
opam install catala

# Verify
catala --version
```

## Usage

```bash
# Typecheck all specifications
make typecheck

# Run tests
make test
```

Individual files:

```bash
# Typecheck
catala typecheck catala/aifmd_article_4.catala_en

# Generate OCaml
catala ocaml catala/professional_investor.catala_en

# Generate Python
catala python catala/raif_structure.catala_en

# Run one test scope under the interpreter
catala interpret tests/test_professional_investor.catala_en --scope=Test_WII_Adherence_And_100k
```

## Specifications

| File | Source | What it encodes |
|------|--------|-----------------|
| `aifmd_article_4.catala_en` | AIFMD Art. 4(1)(a) | Definition of "alternative investment fund" |
| `professional_investor.catala_en` | MiFID II Annex II | Professional investor eligibility criteria |
| `raif_structure.catala_en` | RAIF Law 2016 | Reserved AIF structural requirements |
| `cross_reference.catala_en` | — | Cross-document consistency checks |

## Project Structure

```
phrax/
├── catala/     # Catala specifications
├── tests/      # Test cases
├── paper/      # Technical paper (LaTeX)
└── docs/       # Documentation
```

## Browser build

The specification compiles to JavaScript (Catala -> OCaml -> js_of_ocaml):

```bash
make web   # requires opam deps + node; runs a smoke matrix, ~54KB gzipped
```

The bundle exports `globalThis.SanctaphraxLib` with
`professionalInvestorStatus` and `wellInformedInvestorStatus`. What runs
in the browser is compiled from the statute encoding, not a hand port.

## Paper

The accompanying paper explains the methodology and findings:

```bash
make paper  # requires LaTeX
```

## License

MIT

## Author

Studio Alticcio — [studio@alticc.io](mailto:studio@alticc.io)
