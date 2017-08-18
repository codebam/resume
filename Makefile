# LaTeX Makefile
FILE=resume.tex

all: pdf png

pdf: $(FILE)
	tectonic $(FILE)

png: pdf
	convert -density 300 resume.pdf resume.png
	convert -flatten resume.png resume-white.png

.PHONY: clean
clean:
	rm *.aux *.blg *.out *.bbl *.log
