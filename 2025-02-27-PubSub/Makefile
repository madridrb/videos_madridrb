BUILD_DIR=output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

OUTPUT_RES=1080x720
export OUTPUT_RES

output/full_video.mp4: full_video/* $(BUILD_DIR)/video.mp4 $(BUILD_DIR)/sponsors.mp4 $(BUILD_DIR)/title.mp4 $(BUILD_DIR)/cover.mp4 $(BUILD_DIR)/credits.mp4
	cd full_video && bash gen_full_video.sh

$(BUILD_DIR)/video.mp4: video/* input/*
	cd video && make

$(BUILD_DIR)/sponsors.mp4: sponsors/* ../shared/sponsors*.png
	cd sponsors && bash gen_sponsors.sh

$(BUILD_DIR)/title.mp4: title/*
	cd title && bash gen_title.sh

$(BUILD_DIR)/cover.mp4: cover/* ../shared/madridrb-logo.png
	cd cover && bash gen_cover.sh

$(BUILD_DIR)/credits.mp4: credits/*
	cd credits && bash gen_credits.sh
