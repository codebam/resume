# LaTeX Makefile
FILE=resume
TECTONIC=tectonic
CONVERT=magick
GHR=ghr
USER=codebam
REPO=resume

all: $(FILE).tex pdf png

pdf: $(FILE).pdf
png: $(FILE)?*.png

$(FILE).pdf: $(FILE).tex
	$(TECTONIC) $(FILE).tex

$(FILE)?*.png: $(FILE).pdf
	rm -rf $(FILE)*.png
	$(CONVERT) -density 300 $(FILE).pdf $(FILE).png
	$(CONVERT) $(FILE)*.png -background white -alpha remove -colorspace sRGB $(FILE)-white-%03d.png

upload: $(FILE).pdf $(FILE)?*.png
	mkdir upload
	cp $(FILE)* upload
	$(GHR) -u $(USER) -r $(REPO) "$$(date +'%s')" upload

.PHONY: clean
clean:
	rm -rf *.png *.pdf upload
