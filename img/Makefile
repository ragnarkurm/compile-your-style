# source files for converting for different layouts
LOGO = logo.png
HEADER = header.jpg
BLOCK = block.jpg

# source file for favicon.ico (must be 16x16 ?)
ICO = favicon.png

# provide image directory path for sass
# $IMG: /sites/www.example.com/themes/mytheme/img
IMG_PATH = path.sass

# destination file for concatenated dimensions
IMG_DIMENSIONS = dimensions.sass

# list of destination png files
PNG = \
	logo-wide.png \
	logo-normal.png \
	logo-narrow.png

# list of destination jpg files
JPG = \
	header-wide.jpg \
	header-normal.jpg \
	header-narrow.jpg \
	block-wide.jpg \
	block-normal.jpg \
	block-narrow.jpg \

# list of individual destinations files respective images
SASS = \
	$(patsubst %.png, %.sass, $(PNG)) \
	$(patsubst %.jpg, %.sass, $(JPG))

# default make target
all: favicon.ico $(IMG_DIMENSIONS) $(IMG_PATH)

#
# section of custom conversion rules
#

logo-wide.png: $(LOGO)
	convert $< -geometry x100 $@

logo-normal.png: $(LOGO)
	convert $< -geometry x80 $@

logo-narrow.png: $(LOGO)
	convert $< -geometry x60 $@

header-wide.jpg: $(HEADER)
	convert $< -geometry 400x $@

header-normal.jpg: $(HEADER)
	convert $< -geometry 350x $@

header-narrow.jpg: $(HEADER)
	convert $< -geometry 300x $@

block-wide.jpg: $(BLOCK)
	convert $< -geometry 200x $@

block-normal.jpg: $(BLOCK)
	convert $< -geometry 175x $@

block-narrow.jpg: $(BLOCK)
	convert $< -geometry 150x $@

#
# general rules
#

# Drupal specific
# cut DocRoot,
# retain URL path
# make sure it ends in slash /
$(IMG_PATH): Makefile
	pwd \
	| sed \
		-e 's!^.*\(/sites/.*\)$$!\1!' \
		-e 's!/*$$!/!' \
		-e 's!^!$$IMG: !' \
	> $@

# concatenate individual dimensions to one file
$(IMG_DIMENSIONS): $(SASS)
	cat $^ > $@

# extract width and height from image and output in sass format for png files
%.sass: %.png Makefile
	./wh $< > $@

# extract width and height from image and output in sass format for jpg files
%.sass: %.jpg Makefile
	./wh $< > $@

# png and jpg files depend on Makefile
# if Makefile changes then png and jpg files are remade
$(PNG) $(JPG): Makefile

# first step to create favicon: ICO -> .pnm
favicon.pnm: $(ICO) Makefile
	convert $< +compress $@

# last step to create favicon: .pnm -> .ico
favicon.ico: favicon.pnm Makefile
	ppmtowinicon -output $@ $<

# kill all derived files
clean:
	rm -f \
		$(IMG_DIMENSIONS) \
		$(IMG_PATH) \
		$(JPG) \
		$(PNG) \
		$(SASS) \
		favicon.pnm \
		favicon.ico
