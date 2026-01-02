# phrax

Formal specification of financial regulations using [Catala](https://catala-lang.org).

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

# Interpret a scope
catala interpret catala/professional_investor.catala_en --scope=InvestorClassification
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

## Paper

The accompanying paper explains the methodology and findings:

```bash
make paper  # requires LaTeX
```

## License

MIT

## Author

Aymane Bengrina — [aymane@alticc.io](mailto:aymane@alticc.io)
