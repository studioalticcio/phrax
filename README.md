# Sanctaphrax Specification

**Toward Formal Specification of Luxembourg Fund Structures: A Catala Proof-of-Concept**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This repository contains the technical implementation accompanying the essay "La Tour: On Fund Structures Nobody Has Fully Read."

## Overview

This project demonstrates formal specification of selected provisions from:
- **AIFMD** (Alternative Investment Fund Managers Directive 2011/61/EU)
- **RAIF Law** (Luxembourg Reserved Alternative Investment Fund Law 2016)
- **MiFID II** (Markets in Financial Instruments Directive 2014/65/EU)

Using [Catala](https://catala-lang.org), a domain-specific language for law.

## Repository Structure

```
sanctaphrax-specification/
├── paper/              # LaTeX technical paper
├── catala/             # Catala specifications
│   ├── aifmd_article_4.catala_en
│   ├── professional_investor.catala_en
│   ├── raif_structure.catala_en
│   └── cross_reference.catala_en
├── tests/              # Test suite
└── docs/               # Documentation
```

## Quick Start

### Prerequisites

**Catala** (requires OCaml/opam):
```bash
opam install catala
```

**LaTeX** (for paper compilation):
```bash
# macOS
brew install --cask mactex

# Ubuntu/Debian
sudo apt-get install texlive-full
```

### Build

```bash
# Typecheck Catala specifications
make typecheck

# Run tests
make test

# Compile paper
make paper
```

## Specifications

| File | Legal Source | Description |
|------|--------------|-------------|
| `aifmd_article_4.catala_en` | AIFMD Art. 4(1)(a) | Definition of "AIF" |
| `professional_investor.catala_en` | MiFID II Annex II, RAIF Law Art. 2 | Investor eligibility |
| `raif_structure.catala_en` | RAIF Law 2016 | Structural requirements |
| `cross_reference.catala_en` | — | Document consistency verification |

## Citation

```bibtex
@misc{bengrina2025sanctaphrax,
  title={Toward Formal Specification of Luxembourg Fund Structures: A Catala Proof-of-Concept},
  author={Bengrina, Aymane},
  year={2025},
  howpublished={GitHub},
  url={https://github.com/aymane-bengrina/sanctaphrax-specification}
}
```

## Author

**Aymane Bengrina**  
Studio Alticcio  
aymane@alticc.io

## License

MIT License. See [LICENSE](LICENSE).

## Acknowledgments

- Denis Merigoux and the Catala team at INRIA
- Sarah Lawsky (Northwestern) for foundational work on computational tax law
- Burkhard Schafer (Edinburgh) for computational legal theory
