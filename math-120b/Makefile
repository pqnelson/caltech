FILE=main
TEX=latex
BIB=bibtex

all: pdf

bib: minbib pdf

minbib:
	$(TEX) $(FILE)
	$(BIB) $(FILE)

pdf:
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	dvipdfmx $(FILE).dvi

images:
	cd img && make && cd ..