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

SOURCES = $(addsuffix .sass, $(PIECES))

LAYOUT_CSS = $(addsuffix .$(LAYOUT).css, $(PIECES))

all:
	make -C $(INCLUDES)
	@for layout in $(LAYOUTS); do \
		echo ; \
		echo "    Layout $$layout" ; \
		echo ; \
		make $$layout.css -e LAYOUT=$$layout || exit 1 ; \
	done

# intermediate explicit sass-to-css step is skipped
# so depencency tree is slightly broken
# but we get compilation in one shot with "sass --update"
$(TARGET): $(SOURCES)
	@echo "Compiling $?"
	@LAYOUT=$(LAYOUT) \
	sass \
		--unix-newlines \
		--style compressed \
		--require env.rb \
		`./updates $(LAYOUT) $?`
	@echo "Assembling $@"
	@cat $(LAYOUT_CSS) > $@

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
