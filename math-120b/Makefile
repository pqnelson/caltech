FILE=main
TEX=latex

all: 
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	dvipdfmx $(FILE).dvi

images:
	cd img && make && cd ..