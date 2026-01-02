# Contributing to Sanctaphrax Specification

Thank you for your interest in contributing! This project benefits from collaborative refinement.

## Ways to Contribute

1. **Expand specifications**: Add new fund law provisions
2. **Improve accuracy**: Correct encoding errors or interpretive choices
3. **Add tests**: Increase test coverage
4. **Fix bugs**: Address issues in Catala code or LaTeX
5. **Documentation**: Improve explanations and examples

## Getting Started

1. Fork the repository
2. Clone your fork
3. Install dependencies (see [installation.md](installation.md))
4. Create a feature branch

```bash
git checkout -b feature/your-feature-name
```

## Development Workflow

### Before Making Changes

1. Ensure all tests pass:
   ```bash
   make test
   ```

2. Verify paper compiles:
   ```bash
   make paper
   ```

### Making Changes

- **Catala files**: Follow existing style, document interpretive choices
- **Tests**: Add tests for any new functionality
- **Paper**: Update relevant sections if specifications change
- **Commit messages**: Use clear, descriptive messages

### Pull Request Process

1. Update documentation if needed
2. Ensure all tests pass
3. Run `make clean && make all` to verify build
4. Submit PR with clear description of changes

## Style Guide

### Catala

- Use descriptive names: `is_collective_investment_undertaking`, not `is_ciu`
- Comment extensively, especially interpretive choices
- One scope per logical unit
- Group related structures together

### LaTeX

- One sentence per line (for better diffs)
- Use `\citep{}` for parenthetical citations
- Prefer `\textit{}` over `\emph{}` for consistency

### Markdown

- Use ATX headers (`#`, `##`, etc.)
- Include code blocks with language specifiers
- Keep lines under 100 characters where possible

## Adding New Specifications

When adding a new fund law provision:

1. **Create the spec file**: `catala/[provision_name].catala_en`
2. **Create test file**: `tests/test_[provision_name].catala_en`
3. **Document methodology**: What choices did you make?
4. **Update paper**: Add relevant section or appendix entry
5. **Update Makefile**: Add to `CATALA_FILES` and `TEST_FILES`

### Template for New Spec

```catala
# [Provision Name]
# Source: [Legal reference]
#
# [Brief description]

## Prologue: Data Structures

```catala-metadata
declaration structure [StructureName]:
  data [field] content [type]
```

## [Section Name]

```catala
declaration scope [ScopeName]:
  input [name] content [type]
  output [name] content [type]
```
```

## Code of Conduct

- Be respectful and constructive
- Focus on the work, not the person
- Assume good faith
- Welcome newcomers

## Questions?

Open an issue or contact aymane@alticc.io.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
