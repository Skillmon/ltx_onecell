LTX = pdflatex
TEX = tex

DTX = $(wildcard *.dtx)
NAM = $(DTX:%.dtx=%)
DOC = $(DTX:%.dtx=%.pdf)
STY = $(DTX:%.dtx=%.sty)
TST = $(wildcard *test*.tex)
TNM = $(TST:%.tex=%)
PDF = $(TST:%.tex=%.pdf)



all: $(DOC)
sty: $(STY)
test: $(PDF)
doc: $(DOC)

$(DOC): $(DTX)
	$(LTX) $(DTX)
	$(LTX) $(DTX)
	$(LTX) $(DTX)
$(STY): $(DTX)
	$(TEX) $(DTX)
$(PDF): $(TST) $(STY)
	$(LTX) $(TST)

.PHONY: clean clean_doc clean_sty clean_test clean_all all sty test
clean: clean_test
	-rm $(shell find $(NAM)\.* | grep -Ev '\.dtx$$' | grep -Ev '\.sty$$' | grep -Ev '\.pdf$$')
clean_doc:
	-rm $(DOC)
clean_sty:
	-rm $(STY)
clean_test:
	-rm $(shell find $(TNM)\.* | grep -Ev '\.tex$$')
clean_all: clean clean_doc clean_sty clean_test
