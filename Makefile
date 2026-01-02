.PHONY: all clean test typecheck paper help

# Default target
all: typecheck paper

# Help
help:
	@echo "Sanctaphrax Specification - Build Targets"
	@echo ""
	@echo "  make typecheck  - Typecheck all Catala specifications"
	@echo "  make test       - Run Catala test suite"
	@echo "  make paper      - Compile the technical paper"
	@echo "  make clean      - Remove generated files"
	@echo "  make all        - Run typecheck and compile paper"

# Catala specifications
CATALA_FILES := catala/aifmd_article_4.catala_en \
                catala/professional_investor.catala_en \
                catala/raif_structure.catala_en \
                catala/cross_reference.catala_en

# Typecheck all Catala specifications using clerk
typecheck: $(CATALA_FILES)
	@echo "Typechecking Catala specifications..."
	@for file in $(CATALA_FILES); do \
		echo "  Checking $$file"; \
		clerk typecheck $$file || exit 1; \
	done
	@echo "All specifications typecheck successfully."

# Run test suite
test: typecheck
	@echo "Running Catala tests..."
	clerk test tests/
	@echo "All tests passed."

# Compile the paper
paper:
	@echo "Compiling paper..."
	cd paper && pdflatex -interaction=nonstopmode main.tex
	cd paper && bibtex main || true
	cd paper && pdflatex -interaction=nonstopmode main.tex
	cd paper && pdflatex -interaction=nonstopmode main.tex
	cp paper/main.pdf sanctaphrax-specification.pdf
	@echo "Paper compiled: sanctaphrax-specification.pdf"

# Clean generated files
clean:
	@echo "Cleaning generated files..."
	rm -f paper/*.aux paper/*.bbl paper/*.blg paper/*.log paper/*.out paper/*.toc
	rm -f paper/generated/*.tex
	rm -f sanctaphrax-specification.pdf
	rm -f paper/main.pdf
	rm -rf _build/
	@echo "Clean complete."
