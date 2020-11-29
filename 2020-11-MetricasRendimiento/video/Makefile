BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

../output/video.mp4: $(BUILD_DIR)/opening.mp4 $(BUILD_DIR)/talk.mp4 $(BUILD_DIR)/closing.mp4
	bash gen_video.sh

$(BUILD_DIR)/opening.mp4: opening/*
	cd opening && bash gen_opening.sh

$(BUILD_DIR)/talk.mp4: talk/*
	cd talk && bash gen_talk.sh

$(BUILD_DIR)/closing.mp4: closing/*
	cd closing && bash gen_closing.sh
