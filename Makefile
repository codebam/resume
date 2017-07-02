# LaTeX Makefile
FILE=resume.tex

all: $(FILE)
	tectonic $(FILE)
	convert -density 300 resume.pdf resume.png
	convert -flatten resume.png resume-white.png

.PHONY: clean
clean:
	rm *.aux *.blg *.out *.bbl *.log
