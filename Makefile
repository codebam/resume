# LaTeX Makefile
FILE=resume.tex

all: $(FILE)
	tectonic $(FILE)

.PHONY: clean
clean:
	rm *.aux *.blg *.out *.bbl *.log
