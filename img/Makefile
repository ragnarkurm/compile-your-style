# destination image list
IMAGES = $(addprefix dst/, \
\
	logo.png \
\
	block.jpg \
	header-wide.jpg \
	header-normal.jpg \
	header-narrow.jpg \
)

SASS = dst/_images.sass

# where to install images?
IMG_INSTALL_PATH = ../images

# where to install sass?
SASS_INSTALL_PATH = ../sass/variables

# individual image sass files
IMG_SASS = $(patsubst dst/%, tmp/%.sass, \
	$(filter %.png, $(IMAGES)) \
	$(filter %.jpg, $(IMAGES)) \
)

#
#		general rules
#

# default make target
all: $(IMAGES) $(SASS)

install: install_img install_sass

install_img: $(IMAGES)
	cp $^ $(IMG_INSTALL_PATH)

install_sass: $(SASS)
	cp $^ $(SASS_INSTALL_PATH)

# images depend on Makefile
$(IMAGES): Makefile

# kill all derived files
clean:
	rm -f tmp/* dst/*

#
#		sass
#

# concatenate individual dimensions to one file
dst/_images.sass: src/_images.sass $(IMG_SASS)
	cat $^ > $@

# extract width and height from image and output in sass format for image files
tmp/%.sass: dst/% Makefile wh
	./wh $< > $@

#
#		custom rules
#

# png

dst/logo.png: src/logo.png
	convert $< -geometry x75 $@

# jpg

dst/header-wide.jpg: src/header.jpg
	convert $< -geometry 400x $@

dst/header-normal.jpg: src/header.jpg
	convert $< -geometry 350x $@

dst/header-narrow.jpg: src/header.jpg
	convert $< -geometry 300x $@

dst/block.jpg: src/block.jpg
	cp $< $@
