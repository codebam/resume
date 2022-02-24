# LaTeX Makefile
FILE=resume
TECTONIC=tectonic
CONVERT=convert
GHR=ghr

all: $(FILE).tex $(FILE).pdf $(FILE)?*.png

pdf: $(FILE).pdf
png: $(FILE)?*.png

$(FILE).pdf: $(FILE).tex
	$(TECTONIC) $(FILE).tex

$(FILE)?*.png: $(FILE).pdf
	rm -rf $(FILE)*.png
	$(CONVERT) -density 300 -colorspace RGB $(FILE).pdf $(FILE).png
	$(CONVERT) $(FILE)*.png -colorspace RGB -background white -alpha remove $(FILE)-white.png

upload: $(FILE).pdf $(FILE)?*.png
	mkdir upload
	cp $(FILE)* upload
	$(GHR) "$$(date +'%s')" upload

.PHONY: clean
clean:
	rm -rf *.png *.pdf upload
