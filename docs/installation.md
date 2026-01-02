# Installation Guide

This guide covers installation of Catala and LaTeX for the Sanctaphrax Specification project.

## Prerequisites

- **Operating System**: macOS, Linux, or Windows (WSL recommended)
- **Git**: For cloning the repository
- **opam**: OCaml package manager (for Catala)
- **LaTeX**: For paper compilation

## Installing Catala

Catala is distributed via opam, the OCaml package manager.

### Step 1: Install opam

**macOS (Homebrew):**
```bash
brew install opam
opam init
eval $(opam env)
```

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install opam
opam init
eval $(opam env)
```

**Windows:**
Use WSL (Windows Subsystem for Linux) and follow Linux instructions.

### Step 2: Install Catala

```bash
opam install catala
```

### Step 3: Verify Installation

```bash
catala --version
```

Expected output: `Catala X.Y.Z` (version number)

## Installing LaTeX

### macOS

**Full installation (recommended):**
```bash
brew install --cask mactex
```

**Minimal installation:**
```bash
brew install --cask basictex
sudo tlmgr update --self
sudo tlmgr install collection-latexrecommended
sudo tlmgr install tikz natbib booktabs
```

### Ubuntu/Debian

**Full installation:**
```bash
sudo apt-get install texlive-full
```

**Minimal installation:**
```bash
sudo apt-get install texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended
```

### Verify Installation

```bash
pdflatex --version
bibtex --version
```

## Building the Project

Once both Catala and LaTeX are installed:

```bash
# Clone repository
git clone https://github.com/aymane-bengrina/sanctaphrax-specification.git
cd sanctaphrax-specification

# Typecheck Catala specifications
make typecheck

# Run tests
make test

# Compile paper
make paper
```

The compiled paper will be at `sanctaphrax-specification.pdf`.

## Troubleshooting

### opam init fails
Ensure you have a working shell configuration:
```bash
opam init --disable-sandboxing
```

### Catala not found after installation
Run:
```bash
eval $(opam env)
```

Add to your `.bashrc` or `.zshrc` for persistence.

### LaTeX missing packages
Install via tlmgr:
```bash
sudo tlmgr install [package-name]
```

### TikZ errors
Ensure tikz package is installed:
```bash
sudo tlmgr install pgf
```

## IDE Support

### VS Code
- Install "Catala" extension for syntax highlighting
- Install "LaTeX Workshop" for LaTeX editing

### Emacs
- Use `catala-mode` (available on GitHub)
- Use AUCTeX for LaTeX
