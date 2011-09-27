MAINDIR := ./tex
OUTDIR 	:= .
BIBDIR := .

PAPERNAME	:= example

TEX		:=	$(MAINDIR)/$(PAPERNAME).tex
BIB		:=	$(BIBDIR)/$(PAPERNAME)
OUTFILE	:=	$(OUTDIR)/example

all: $(OUTFILE).pdf #slide

#slide:
#	make -C slide-1.0

$(OUTFILE).dvi:$(TEX) $(BIB).bib
	latex $(TEX)
	latex $(TEX)
	latex $(TEX)
	latex $(TEX)
	bibtex $(BIB)
	latex $(TEX)
	latex $(TEX)
	latex $(TEX)
	latex $(TEX)

html.sty:
	echo % Hack to keep some versions of harvard.sty happy. > html.sty
	
$(OUTFILE).ps:$(OUTFILE).dvi
	dvips -t a4 -Ppdf $(OUTFILE)
	
$(OUTFILE).pdf:$(OUTFILE).ps
	ps2pdf -dMaxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -dCompatibilityLevel=1.2 -sPAPERSIZE=a4 $(OUTFILE).ps
		
clean:
	rm -f  *~ *.bak *.o *.ps *.dvi *.aux *.log *.backup *.bbl *.blg *.loa *.los html.sty *.out *.lof *.lot *.toc
#	make -C slide-1.0 clean

clobber: clean
	rm -f $(OUTFILE).pdf 
#	make -C slide-1.0 distclean

install:

