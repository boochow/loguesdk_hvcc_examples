PLATFORMDIR ?= $(HOME)/logue-sdk/platform

PD_DIR ?= ./pd
PD_FILES := $(wildcard $(PD_DIR)/*.pd)
PATCHES := $(notdir $(basename $(PD_FILES)))
INSTALLDIR ?= ..

INSTALL :=INSTALLDIR=$(INSTALLDIR) install

all: $(PATCHES)

$(PATCHES):
	@echo "Processing $@..."
	mkdir -p $@
	hvcc $(PD_DIR)/$@.pd -G loguesdk_v1 -o $@ -n $@
	cd $@/logue_unit && \
		make PLATFORMDIR=$(PLATFORMDIR)/nutekt-digital $(INSTALL) && \
		make PLATFORMDIR=$(PLATFORMDIR)/prologue $(INSTALL) && \
		make PLATFORMDIR=$(PLATFORMDIR)/minilogue-xd $(INSTALL)

.PHONY: clean
clean:
	@for patch in $(PATCHES); do \
		cd $$patch/logue_unit && make clean; \
	done

.PHONY: clean-all
clean-all:
	@for patch in $(PATCHES); do \
		rm -fr $$patch; \
	done
