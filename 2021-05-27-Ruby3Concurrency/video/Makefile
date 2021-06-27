BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START_1=04:38.5
STREAM_END_1=1:24:57

STREAM_START_2=1:27:08
STREAM_END_2=1:29:44

STREAM_START_3=1:31:45
STREAM_END_3=1:32:10

../output/video.mp4: $(BUILD_DIR)/part_1.mp4 $(BUILD_DIR)/part_2.mp4 $(BUILD_DIR)/part_3.mp4 
	bash gen_video.sh

$(BUILD_DIR)/part_1.mp4: part/*
	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1)

$(BUILD_DIR)/part_2.mp4: part/*
	cd part && bash gen_part.sh 2 $(STREAM_START_2) $(STREAM_END_2)

$(BUILD_DIR)/part_3.mp4: part/*
	cd part && bash gen_part.sh 3 $(STREAM_START_3) $(STREAM_END_3)
