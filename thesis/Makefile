BASENAME=thesis
DISTNAME=thesis_latex
DISTFOLDER?=$(shell pwd)

# OS detection
OS=$(shell uname)

# pdf viewer
ifeq ($(OS), Darwin)
	VIEWER=open
	VIEWER_OPTIONS=
else
	VIEWER=acroread
	VIEWER_OPTIONS=
endif


.PHONY: default
default: clean compile view

compile:
	pdflatex $(BASENAME)
	bibtex $(BASENAME)
	makeglossaries $(BASENAME)
	pdflatex $(BASENAME)
	pdflatex $(BASENAME)

view:
	$(VIEWER) $(VIEWER_OPTIONS) $(BASENAME).pdf

zip: clean compile
	zip -9 -r --exclude=*.svn* $(BASENAME).zip figures abbrev bibliography chapters styles $(BASENAME).tex INSOthesis.cls Makefile README.txt $(BASENAME).pdf

dist: zip
	cp $(BASENAME).zip $(DISTFOLDER)/$(DISTNAME).zip

.PHONY: clean
clean:
	rm -f *.aux *.bbl *.bla *.blg *.dvi *.loa *.lof *.log *.lot *.out *.tdo *.toc *-blx.bib *run.xml *.cut *.gxg *.glx *.ilg *.lol *.gxs *.acn *.glo *.ist *.acr *.alg *.glg *.gls *.idx *.ind *.xdy
	rm -f *.ps *.pdf
	rm -f $(BASENAME).zip
