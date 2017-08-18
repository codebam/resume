# LaTeX Makefile
FILE=resume

all: $(FILE).tex pdf png

pdf:
	tectonic $(FILE).tex

png: pdf
	convert -density 300 $(FILE).pdf $(FILE).png
	convert -flatten $(FILE).pdf $(FILE)-white.png

.PHONY: clean
clean:
	rm *.aux *.blg *.out *.bbl *.log
