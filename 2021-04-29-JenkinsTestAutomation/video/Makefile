BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

MEET_DIFF=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff 04:09 00:58)

STREAM_START_1=00:00:35
STREAM_END_1=00:34:18

STREAM_START_2=00:38:51
STREAM_END_2=00:56:25

../output/video.mp4: $(BUILD_DIR)/part_1.mp4 $(BUILD_DIR)/part_2.mp4 
	bash gen_video.sh

$(BUILD_DIR)/part_1.mp4: part/*
	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1) $(MEET_DIFF)

$(BUILD_DIR)/part_2.mp4: part/*
	cd part && bash gen_part.sh 2 $(STREAM_START_2) $(STREAM_END_2) $(MEET_DIFF)
