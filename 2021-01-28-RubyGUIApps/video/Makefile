BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START=00:07:50
STREAM_END=01:22:44
STREAM_DURATION=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff $(STREAM_END) $(STREAM_START))

BANNER_1_START=01:08:03
BANNER_1_END=01:08:10

QA_START_1=01:27:00
QA_END_1=01:31:14
QA_DURATION_1=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff $(QA_END_1) $(QA_START_1))

QA_START_2=01:36:24
QA_END_2=01:36:35
QA_DURATION_2=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff $(QA_END_2) $(QA_START_2))

MEET_DIFF=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff 01:32:29 01:25:54)

QA_AUDIO_START_1=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_sum $(QA_START_1) $(MEET_DIFF))
QA_AUDIO_START_2=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_sum $(QA_START_2) $(MEET_DIFF))

QA_SKETCH_DURATION=5

QA_TOTAL_DURATION=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_sum $(QA_DURATION_1) $(QA_DURATION_2) $(QA_SKETCH_DURATION))

export STREAM_START
export STREAM_END
export STREAM_DURATION
export BANNER_1_START
export BANNER_1_END
export QA_START_1
export QA_END_1
export QA_DURATION_1
export QA_START_2
export QA_END_2
export QA_DURATION_2
export MEET_DIFF
export QA_AUDIO_START_1
export QA_AUDIO_START_2
export QA_SKETCH_DURATION
export QA_TOTAL_DURATION

../output/video.mp4: $(BUILD_DIR)/talk.mp4 $(BUILD_DIR)/qa.mp4
	bash gen_video.sh

$(BUILD_DIR)/talk.mp4: talk/*
	cd talk && bash gen_talk.sh

$(BUILD_DIR)/qa.mp4: qa/*
	cd qa && bash gen_qa.sh
