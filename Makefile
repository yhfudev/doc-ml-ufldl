# use latex's option -jobname to control the compiling of multiple language text.
# Author: Yunhui Fu <yhfudev@gmail.com>
# License: GPL v3.0

#LANG=en zh tw
LANG=en zh tw
SRC_PREFIX=ufldl

define SRC_FROM_PREFIX
	$(addsuffix .tex, $(foreach file, $(SRC_PREFIX), $(basename $(notdir $(file)))))
endef
SOURCES=$(SRC_FROM_PREFIX)

#define OBJ_FROM_SRC
	#$(addsuffix .o, $(foreach file, $(SOURCES), $(basename $(notdir $(file)))))
#endef
#OBJECTS=$(OBJ_FROM_SRC)

define OUTPREFIX_FROM_SRC
	$(foreach suffix, $(LANG), $(addsuffix .$(suffix), $(foreach file, $(SOURCES), $(basename $(notdir $(file))))))
endef
OUTPREFIXS=$(OUTPREFIX_FROM_SRC)

define PDF_FROM_PREFIX
	$(addsuffix .pdf, $(foreach file, $(OUTPREFIXS), $(notdir $(file))))
endef
OUTPDFS=$(PDF_FROM_PREFIX)

LATEXTMP_SUFFIX=aux idx ilg ind log out
define LATEXTMP_FROM_PREFIX
	$(foreach suffix, $(LATEXTMP_SUFFIX), $(addsuffix .$(suffix), $(foreach file, $(SOURCES), $(basename $(notdir $(file))))))
endef
LATEXTMP=$(LATEXTMP_FROM_PREFIX)

DEFAULT: $(OUTPDFS)
#	@echo OUTPDFS=$(OUTPDFS)

$(OUTPDFS): $(OUTPREFIXS)

$(OUTPREFIXS): $(SOURCES)
	@touch $@
	xelatex -jobname lang-$(shell echo $@ | awk -F. '{print $$2 }') $(shell echo $@ | awk -F. '{print $$1 }')
	makeindex lang-$(shell echo $@| awk -F. '{print $$2 }')
	#bibtex lang-$(shell echo $@| awk -F. '{print $$2 }')
	#xelatex -jobname lang-$(shell echo $@ | awk -F. '{print $$2 }') $(shell echo $@ | awk -F. '{print $$1 }')
	xelatex -jobname lang-$(shell echo $@ | awk -F. '{print $$2 }') $(shell echo $@ | awk -F. '{print $$1 }')
	mv lang-$(shell echo $@ | awk -F. '{print $$2 }').pdf $@.pdf
	@echo ""

clean:
	@rm -f Makefile~ $(OUTPREFIXS) $(OUTPDFS) $(LATEXTMP) lang-*
