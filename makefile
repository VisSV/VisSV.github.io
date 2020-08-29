
#SHELL := /bin/bash
PATH := node_modules/.bin:$(PATH)

DISTDIR := dist
DEPLOYSERVER := vissv@vissv.org:httpdocs/

RSYNCOPTS := -arv --delete

SRC := $(shell ls *.html| grep -v '^_')
TGT := $(SRC:%=$(DISTDIR)/%)

.PHONY: all clean html css img js deploy test data config stats

all: html css js img data config stats

deploy: 
	make clean
	npm install
	make all
	rsync $(RSYNCOPTS) $(DISTDIR)/ $(DEPLOYSERVER)/

test:
	npm test

data: $(DISTDIR)
	cp -R sv_stats $(DISTDIR)/

html: $(TGT) 

css: $(DISTDIR)
	cp -R css $(DISTDIR)/

js: $(DISTDIR)/js
	cp js/common.js $(DISTDIR)/js/common.js
	cp js/config.js $(DISTDIR)/js/config.js
	cp js/d3.v4.min.js $(DISTDIR)/js/d3.v4.min.js
	cp js/sponsors.js $(DISTDIR)/js/sponsors.js
	cp node_modules/jquery/dist/jquery.min.js $(DISTDIR)/js/jquery.min.js
	cp node_modules/parsleyjs/dist/parsley.min.js $(DISTDIR)/js/parsley.min.js

$(DISTDIR)/css:
	mkdir -p $@

$(DISTDIR)/js: 
	mkdir -p $@

img: $(DISTDIR)
	cp -R img $(DISTDIR)/

config: $(DISTDIR)
	cp -R config $(DISTDIR)/

stats: $(DISTDIR)
	cp -R stats $(DISTDIR)/


$(DISTDIR):
	mkdir $(DISTDIR)

clean:
	rm -rf $(DISTDIR)

$(DISTDIR)/%.html: %.html $(DISTDIR) _header.html _footer.html
	fuse -i $< -o $@

# $(DISTDIR)/stats/%.html: %.html $(DISTDIR)/stats/ _header.html _footer.html
# 	fuse -i $< -o $@



