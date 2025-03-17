BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START_1=00:55
STREAM_END_1=38:56

STREAM_START_2=10:23
STREAM_END_2=48:24

CAMERA_DIFF=09:28

../output/video.mp4: $(BUILD_DIR)/part_1.mp4
	bash gen_video.sh

$(BUILD_DIR)/part_1.mp4: part/* $(BUILD_DIR)/joined_camera.MTS
	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1) $(CAMERA_DIFF)

$(BUILD_DIR)/joined_camera.MTS: camera_parts.txt
	join_camera_parts.sh
