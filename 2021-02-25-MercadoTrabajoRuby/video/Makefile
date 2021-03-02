BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START=00:01:32
STREAM_END=01:39:40
STREAM_DURATION=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff $(STREAM_END) $(STREAM_START))

export STREAM_START
export STREAM_END
export STREAM_DURATION

../output/video.mp4: gen_video.sh video_script*
	bash gen_video.sh
