.PHONY: all clean default build-index

default: all

SOURCES_DOT = $(wildcard *.dot)
SOURCES_MD = $(wildcard *-cheat-sheet.md)

OBJECTS_DOT_SVG = $(SOURCES_DOT:.dot=.svg)
OBJECTS_HTML = $(SOURCES_MD:.md=.html)
OBJECTS_PDF = $(SOURCES_MD:.md=.pdf)
OBJECTS_TEX = $(SOURCES_MD:.md=.tex)

OBJECTS = \
	$(OBJECTS_DOT_SVG) \
	$(OBJECTS_HTML) \
	# $(OBJECTS_PDF) \
	$(OBJECTS_TEX)

all: clean $(OBJECTS) build-index

$(OBJECTS):

$(OBJECTS_HTML): $(OBJECTS_DOT_SVG)

$(OBJECTS_PDF): $(OBJECTS_DOT_SVG)

PANDOC = pandoc

PANDOC_FLAGS = \
	--standalone \
	--from=markdown+yaml_metadata_block

PANDOC_HTML_FLAGS = \
	$(PANDOC_FLAGS) \
	--template=base/cheat-sheet.html

PDF_ENGINE = xelatex
PANDOC_TEX_FLAGS = \
	$(PANDOC_FLAGS) \
	--template=base/cheat-sheet.tex \
	--pdf-engine=$(PDF_ENGINE)

%.svg: %.dot
	dot -Tsvg -o $@ $<

%.html: %.md %.yml base/cheat-sheet.html
	$(PANDOC) $(PANDOC_HTML_FLAGS) -o $@ $*.yml $<

%.pdf: %.md %.yml base/cheat-sheet.tex
	$(PANDOC) $(PANDOC_TEX_FLAGS) -o $@ $*.yml $<

%.tex: %.md %.yml base/cheat-sheet.tex
	$(PANDOC) $(PANDOC_TEX_FLAGS) -o $@ $*.yml $<

build-index: gopass-cheat-sheet.html
	cp gopass-cheat-sheet.html index.html

clean:
	rm -f $(OBJECTS) index.html
