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
	$(CONVERT) -density 300 $(FILE).pdf -quality 100 $(FILE).png
	$(CONVERT) -density 300 $(FILE)*.png -background white -alpha remove -quality 100 $(FILE)-white.png

upload: $(FILE).pdf $(FILE)?*.png
	mkdir upload
	cp $(FILE)* upload
	$(GHR) -u $(USER) -r $(REPO) "$$(date +'%s')" upload

.PHONY: clean
clean:
	rm -rf *.png *.pdf upload
