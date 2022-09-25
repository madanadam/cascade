#QMAKE_RULES = noftdi
QMAKE_PC = qmake

SUBDIRS = pc scripts

all: $(SUBDIRS) patch
.PHONY: all clean $(SUBDIRS) patch win_demo

$(SUBDIRS):
	$(MAKE) -C $@ QMAKE_RULES="$(QMAKE_RULES)"

pc: pc/Makefile
pc/Makefile: hiscanemu.pro Makefile
	mkdir -p pc ; $(QMAKE_PC) CONFIG+="$(QMAKE_RULES) " -o $@

clean:
	for i in $(SUBDIRS) ; do $(MAKE) -C $$i clean ; done
