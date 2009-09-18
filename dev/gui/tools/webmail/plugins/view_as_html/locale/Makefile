# $Id: Makefile 1638 2009-04-02 02:35:58Z haeber $
.SUFFIXES:
.SUFFIXES: .po .mo

SUBDIR = $(wildcard */LC_MESSAGES/*.po)

%.mo: %.po
	msgfmt $? -o $@

all: $(foreach dir,$(SUBDIR),$(basename $(dir)).mo)
