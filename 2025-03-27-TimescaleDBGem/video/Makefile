BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START_1=00:01
STREAM_END_1=55:06

../output/video.mp4: $(BUILD_DIR)/part_1.mp4
	bash gen_video.sh

$(BUILD_DIR)/part_1.mp4: part/*
	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1) $(MEET_DIFF)
