FILE=main
TEX=latex

all: images
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	dvipdfmx $(FILE).dvi

images:
	cd img && make && cd ..