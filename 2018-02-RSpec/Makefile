BUILD_DIR=output/build

output/full_video.mp4: gen_full_video.sh full_video_parts.txt $(BUILD_DIR)/cover.mp4 $(BUILD_DIR)/title.mp4 $(BUILD_DIR)/sponsors.mp4 $(BUILD_DIR)/video.mp4
	bash gen_full_video.sh

$(BUILD_DIR)/video.mp4: $(BUILD_DIR) gen_video.sh video_script $(BUILD_DIR)/camera.MTS
	bash gen_video.sh

$(BUILD_DIR)/camera.mp4: $(BUILD_DIR) gen_camera.sh input/*.MTS
	bash gen_camera.sh

$(BUILD_DIR)/sponsors.mp4: $(BUILD_DIR) gen_sponsors.sh sponsors_script ../shared/sponsors*.png
	bash gen_sponsors.sh

$(BUILD_DIR)/title.mp4: $(BUILD_DIR) gen_title.sh title_script title_text.txt speaker_text.txt
	bash gen_title.sh

$(BUILD_DIR)/cover.mp4: $(BUILD_DIR) gen_cover.sh cover_script cover_text.txt date_text.txt contact_text.txt
	bash gen_cover.sh

$(BUILD_DIR): output
	mkdir -p $(BUILD_DIR)

output:
	@echo You need to create the 'output' folder
	exit 1

