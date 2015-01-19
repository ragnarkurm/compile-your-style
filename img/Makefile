# source files for converting for different layouts
LOGO = logo.png
HEADER = header.jpg
BLOCK = block.jpg

# source file for favicon.ico (must be 16x16 ?)
ICO = favicon.png

# destination file for concatenated image dimensions
IMG_DIMENSIONS = _images.sass

# where to install images?
IMG_INSTALL_PATH = ../images

# where to install sass files?
SASS_INSTALL_PATH = ../sass/variables

# absolute web path to installed images
IMG_URL_PATH = /sites/default/theme/fancy/img/

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
	$(patsubst %.png, %.png.sass, $(PNG)) \
	$(patsubst %.jpg, %.jpg.sass, $(JPG))

# default make target
all: favicon.ico $(IMG_DIMENSIONS)

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

install: install_img install_sass

install_img: $(PNG) $(JPG)
	cp $^ $(IMG_INSTALL_PATH)

install_sass: $(IMG_DIMENSIONS)
	cp $^ $(SASS_INSTALL_PATH)

# concatenate individual dimensions to one file
$(IMG_DIMENSIONS): $(SASS)
	# allow override from commandline for production compilation
	echo '$$IMG: "$(IMG_URL_PATH)" !default' > $@
	cat $^ >> $@


# extract width and height from image and output in sass format for png files
%.png.sass: %.png Makefile
	./wh $< > $@

# extract width and height from image and output in sass format for jpg files
%.jpg.sass: %.jpg Makefile
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
		$(JPG) \
		$(PNG) \
		$(SASS) \
		favicon.pnm \
		favicon.ico
