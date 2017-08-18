# LaTeX Makefile
CC=tectonic
FILE=resume
CONVERT=convert

all: $(FILE).tex pdf png

pdf:
	$(CC) $(FILE).tex

png: pdf
	$(CONVERT) -density 300 $(FILE).pdf $(FILE).png
	$(CONVERT) -flatten $(FILE).pdf $(FILE)-white.png

.PHONY: clean
clean:
	rm *.aux *.blg *.out *.bbl *.log
