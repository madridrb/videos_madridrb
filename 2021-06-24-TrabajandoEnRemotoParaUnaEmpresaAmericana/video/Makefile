BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START_1=00:11:01
STREAM_END_1=1:32:43

STREAM_START_2=1:35:21
STREAM_END_2=1:42:10

STREAM_START_3=1:43:46
STREAM_END_3=1:48:01

STREAM_START_4=1:52:28
STREAM_END_4=1:52:44

MEET_DIFF=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff 25:27.75 11:52)

AUDIO_START=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_sum $(STREAM_START) $(MEET_DIFF))

export MEET_DIFF
export AUDIO_START

../output/video.mp4: $(BUILD_DIR)/part_1.mp4 $(BUILD_DIR)/part_2.mp4 $(BUILD_DIR)/part_3.mp4 $(BUILD_DIR)/part_4.mp4
	bash gen_video.sh

$(BUILD_DIR)/part_1.mp4: part/*
	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1) $(MEET_DIFF)

$(BUILD_DIR)/part_2.mp4: part/*
	cd part && bash gen_part.sh 2 $(STREAM_START_2) $(STREAM_END_2) $(MEET_DIFF)

$(BUILD_DIR)/part_3.mp4: part/*
	cd part && bash gen_part.sh 3 $(STREAM_START_3) $(STREAM_END_3) $(MEET_DIFF)

$(BUILD_DIR)/part_4.mp4: part/*
	cd part && bash gen_part.sh 4 $(STREAM_START_4) $(STREAM_END_4) $(MEET_DIFF)
