TEX=latex
FILE=math110a

all: images
	$(TEX) $(FILE)
	bibtex $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	dvipdfmx $(FILE).dvi

images:
#	cd img && make && cd ..