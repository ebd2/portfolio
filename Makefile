SRC_IMAGE_DIR := src-pictures
TARGET_IMAGE_DIR := docs
SAMPLE_IMAGE_DIR := sample-pics

SIZE := 2400
SRC_IMAGES := $(wildcard $(SRC_IMAGE_DIR)/*)
IMAGES := $(SRC_IMAGES:$(SRC_IMAGE_DIR)/%=$(TARGET_IMAGE_DIR)/%)
SAMPLES := $(SRC_IMAGES:$(SRC_IMAGE_DIR)/%=$(SAMPLE_IMAGE_DIR)/%)

all: $(IMAGES)

$(TARGET_IMAGE_DIR)/%: $(SRC_IMAGE_DIR)/% Makefile
	convert -resize $(SIZE)x$(SIZE) $< $@

.PHONY: samples
samples: $(SAMPLES)

$(SAMPLE_IMAGE_DIR)/%: $(SRC_IMAGE_DIR)/% Makefile | $(SAMPLE_IMAGE_DIR)
	convert -resize 500x500 $< $@

$(SAMPLE_IMAGE_DIR):
	mkdir $@
