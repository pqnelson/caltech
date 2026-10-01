TEX=latex
FILE=fluid-mechanics

all: images
	$(TEX) $(FILE)
	bibtex $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	dvipdfmx $(FILE).dvi

images:
	cd img && make && cd ..