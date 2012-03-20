BASENAME=expose


# OS detection
OS=$(shell uname)

# pdf viewer
ifeq ($(OS), Darwin)
	PDF_VIEWER=open
	PDF_VIEWER_OPTIONS=
else
	PDF_VIEWER=acroread
	PDF_VIEWER_OPTIONS=
endif


.PHONY: default
default: compile view

compile: 
	pdflatex $(BASENAME)
	bibtex $(BASENAME)
	pdflatex $(BASENAME)
	pdflatex $(BASENAME)

view:
	$(PDF_VIEWER) $(PDF_VIEWER_OPTIONS) $(BASENAME).pdf

zip:
	zip -9 -r --exclude=*.svn* $(BASENAME).zip imgs db.bib $(BASENAME).tex INSOexpose.cls Makefile README

.PHONY: clean
clean:
	rm -f *.aux *.out *.ps *.pdf *.log *.dvi *.bbl *.blg *.run.xml *.toc *-blx.bib
