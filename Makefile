# LaTeX Makefile
CC=tectonic
FILE=resume
CONVERT=convert

all: $(FILE).tex $(FILE).pdf $(FILE).png

$(FILE).pdf: $(FILE).tex
	$(CC) $(FILE).tex

$(FILE).png: $(FILE).pdf
	$(CONVERT) -density 300 $(FILE).pdf $(FILE).png
	$(CONVERT) $(FILE).png -background white -alpha remove $(FILE)-white.png

.PHONY: clean
clean:
	rm *.aux *.blg *.out *.bbl *.log
