IMAGES = ../../img/dimensions

DST = defs.sass

SRC = $(addsuffix .sass, \
	img \
	colors \
	image_styles \
	$(IMAGES) \
	mixins \
	dimensions \
)

$(DST): $(SRC)
	cat $^ > $@

clean:
	rm -f $(DST)
