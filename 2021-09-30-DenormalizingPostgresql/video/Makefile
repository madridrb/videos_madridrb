BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START_1=00:06:37
STREAM_END_1=00:06:50

STREAM_START_2=00:13:08
STREAM_END_2=00:38:51

STREAM_START_3=00:40:34
STREAM_END_3=00:45:38

STREAM_START_4=00:46:19
STREAM_END_4=00:51:45

STREAM_START_5=00:52:01
STREAM_END_5=00:59:41

STREAM_START_6=01:00:57
STREAM_END_6=01:01:46

MEET_DIFF=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff 01:01:18 01:00:57)

AUDIO_START=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_sum $(STREAM_START) $(MEET_DIFF))

export MEET_DIFF
export AUDIO_START

../output/video.mp4: $(BUILD_DIR)/part_1.mp4 $(BUILD_DIR)/part_2.mp4 $(BUILD_DIR)/part_3.mp4 $(BUILD_DIR)/part_4.mp4 $(BUILD_DIR)/part_5.mp4 $(BUILD_DIR)/part_6.mp4
	bash gen_video.sh

$(BUILD_DIR)/part_1.mp4: part/*
	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1) $(MEET_DIFF)

$(BUILD_DIR)/part_2.mp4: part/*
	cd part && bash gen_part.sh 2 $(STREAM_START_2) $(STREAM_END_2) $(MEET_DIFF)

$(BUILD_DIR)/part_3.mp4: part/*
	cd part && bash gen_part.sh 3 $(STREAM_START_3) $(STREAM_END_3) $(MEET_DIFF)

$(BUILD_DIR)/part_4.mp4: part/*
	cd part && bash gen_part.sh 4 $(STREAM_START_4) $(STREAM_END_4) $(MEET_DIFF)

$(BUILD_DIR)/part_5.mp4: part/*
	cd part && bash gen_part.sh 5 $(STREAM_START_5) $(STREAM_END_5) $(MEET_DIFF)

$(BUILD_DIR)/part_6.mp4: part/*
	cd part && bash gen_part.sh 6 $(STREAM_START_6) $(STREAM_END_6) $(MEET_DIFF)
