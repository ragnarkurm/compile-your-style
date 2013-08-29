TARGET = $(LAYOUT).css

INCLUDES = includes

DEFS = $(INCLUDES)/defs.sass

LAYOUTS = \
	global \
	my-alpha-default \
	my-alpha-default-narrow \
	my-alpha-default-normal \
	my-alpha-default-wide

include files.mk

LAYOUT_CSS = $(addsuffix .$(LAYOUT).css, \
	$(ELEMENTS) \
	$(STRUCTURES) \
	$(FIELDS) \
	$(VIEWS) \
	$(NODES) \
	$(PAGES) \
)

all:
	make -C $(INCLUDES)
	@for layout in $(LAYOUTS); do \
		echo ; \
		echo "    Layout $$layout" ; \
		echo ; \
		make $$layout.css -e LAYOUT=$$layout || exit 1 ; \
	done

$(TARGET): $(LAYOUT_CSS)
	@echo "Assembling $@"
	@cat $^ > $@

$(LAYOUT_CSS): %.$(LAYOUT).css: %.sass
	@echo "Compiling $*"
	@LAYOUT=$(LAYOUT) \
	sass \
		--unix-newlines \
		--style compressed \
		--require lib/env.rb \
		< $< \
		> $@

$(LAYOUT_CSS): $(DEFS) Makefile

clean:
	find . -name '.sass-cache' -type d -print0 | xargs -0 rm -rf
	for layout in $(LAYOUTS); do \
		make clean-$$layout -e LAYOUT=$$layout || exit 1 ; \
	done
	make -C $(INCLUDES) clean

clean-$(LAYOUT):
	rm -f $(LAYOUT_CSS)
	rm -f $(TARGET)
