# Methodology

This document explains the methodology used to translate Luxembourg fund law provisions into Catala specifications.

## Overview

The formalization process follows four stages:

1. **Text Selection** — Identify provisions suitable for encoding
2. **Structural Analysis** — Decompose into conditions, definitions, exceptions
3. **Encoding** — Translate to Catala syntax
4. **Documentation** — Record interpretive choices and limitations

## Stage 1: Text Selection

Not all legal text is suitable for formal specification. We prioritized provisions that are:

- **Algorithmic**: Produce a determinable outcome from defined inputs
- **Self-contained**: Don't require extensive cross-references to external material
- **Consequential**: Actually used in fund structuring practice
- **Representative**: Illustrate different Catala features

### Selected Provisions

| Provision | Source | Type |
|-----------|--------|------|
| AIF Definition | AIFMD Art. 4(1)(a) | Classification |
| AIF Exclusions | AIFMD Art. 2(3) | Exception hierarchy |
| Professional Investor | MiFID II Annex II | Multi-path eligibility |
| Well-Informed Investor | RAIF Law Art. 2 | Extension/overlay |
| RAIF Structure | RAIF Law | Compliance checklist |
| Cross-Reference | Custom | Consistency verification |

## Stage 2: Structural Analysis

Each provision was decomposed into:

- **Inputs**: What information is needed?
- **Conditions**: What must be true?
- **Outputs**: What is determined?
- **Exceptions**: What overrides the general rule?

### Example: AIF Definition

```
INPUTS:
  - Is collective investment undertaking?
  - Raises capital from investors?
  - Number of investors
  - Has defined investment policy?
  - Requires UCITS authorization?

CONDITIONS:
  - All positive criteria must be met
  - UCITS authorization must NOT be required

OUTPUTS:
  - qualifies_as_aif: boolean
  - classification_reasoning: text

EXCEPTIONS:
  - Article 2 exclusions (holding company, pension fund, etc.)
```

## Stage 3: Encoding

Translation to Catala follows the language's idioms:

### Structures
Group related data into `declaration structure` blocks.

### Scopes
Define computational units with `declaration scope`, specifying:
- `input` — provided by caller
- `output` — returned by scope
- `internal` — intermediate calculations

### Definitions
Provide values using `definition ... equals ...`.

### Exceptions
Override base definitions using `exception definition ... under condition ...`.

## Stage 4: Documentation

For each specification, we document:

1. **Source text**: The legal provision being encoded
2. **Interpretive choices**: Where the text was ambiguous
3. **Limitations**: What the specification does NOT capture
4. **Test cases**: How correctness is verified

### Interpretive Choices Format

| Element | Choice Made | Alternative | Rationale |
|---------|-------------|-------------|-----------|
| [Term] | [Our encoding] | [Other option] | [Why we chose this] |

## Limitations Acknowledged

This methodology is transparent about what formal specification cannot do:

- **Open-textured concepts** require human judgment
- **Qualitative assessments** (expertise, adequacy) resist encoding
- **Temporal dynamics** require version-controlled specifications
- **Multi-jurisdictional overlay** increases complexity exponentially

The goal is not to hide these limitations but to surface them explicitly.

## Reproducibility

All specifications are available in the `catala/` directory. To verify:

```bash
# Typecheck specifications
make catala

# Run test suite
make test
```
