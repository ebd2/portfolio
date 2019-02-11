SRC_IMAGE_DIR := src-pictures
TARGET_IMAGE_DIR := docs

SIZE := 2400
SRC_IMAGES := $(wildcard $(SRC_IMAGE_DIR)/*)
IMAGES := $(SRC_IMAGES:$(SRC_IMAGE_DIR)/%=$(TARGET_IMAGE_DIR)/%)

all: $(IMAGES)

$(TARGET_IMAGE_DIR)/%: $(SRC_IMAGE_DIR)/% Makefile
	convert -resize $(SIZE)x$(SIZE) $< $@
