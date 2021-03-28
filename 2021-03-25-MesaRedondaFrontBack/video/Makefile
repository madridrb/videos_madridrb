BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START=00:16:53
STREAM_END=01:47:18
STREAM_DURATION=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff $(STREAM_END) $(STREAM_START))

MEET_DIFF=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff 22:02 21:13)

AUDIO_START=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_sum $(STREAM_START) $(MEET_DIFF))

export STREAM_START
export STREAM_END
export STREAM_DURATION
export MEET_DIFF
export AUDIO_START

../output/video.mp4: gen_video.sh video_script.rb
	bash gen_video.sh
