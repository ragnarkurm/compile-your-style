IMG_PATH = ../../img/path

IMG_DIMENSIONS = ../../img/dimensions

DST = defs.sass

SRC = $(addsuffix .sass, \
	layout \
	$(IMG_PATH) \
	colors \
	image_styles \
	$(IMG_DIMENSIONS) \
	dimensions \
	mixins \
)

$(DST): $(SRC)
	cat $^ > $@

clean:
	rm -f $(DST)
