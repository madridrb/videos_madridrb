BUILD_DIR=../output/build
$(info $(shell mkdir -p $(BUILD_DIR)))

SCRIPT_LIB_DIR=$(realpath ../../lib)
export SCRIPT_LIB_DIR

STREAM_START=00:01:32
STREAM_END=01:39:40
STREAM_DURATION=$(shell $(SCRIPT_LIB_DIR)/ffmpeg_time_diff $(STREAM_END) $(STREAM_START))

STREAM_START_1=00:01:32
STREAM_END_1=00:15:24

STREAM_START_2=00:15:52
STREAM_END_2=00:27:32

STREAM_START_3=00:31:38
STREAM_END_3=00:33:31

STREAM_START_4=00:34:14
STREAM_END_4=00:40:41

STREAM_START_5=00:42:31
STREAM_END_5=00:55:21

STREAM_START_6=00:58:42
STREAM_END_6=01:03:19

STREAM_START_7=01:05:44
STREAM_END_7=01:07:44

STREAM_START_8=01:08:08
STREAM_END_8=01:09:02

STREAM_START_9=01:10:00
STREAM_END_9=01:17:05

STREAM_START_10=01:19:31
STREAM_END_10=01:22:41

STREAM_START_11=01:38:00
STREAM_END_11=01:39:38

export STREAM_START
export STREAM_END
export STREAM_DURATION

../output/video.mp4: $(BUILD_DIR)/part_1.mp4 $(BUILD_DIR)/part_2.mp4 $(BUILD_DIR)/part_3.mp4 $(BUILD_DIR)/part_4.mp4 $(BUILD_DIR)/part_5.mp4 $(BUILD_DIR)/part_6.mp4 $(BUILD_DIR)/part_7.mp4 $(BUILD_DIR)/part_8.mp4 $(BUILD_DIR)/part_9.mp4 $(BUILD_DIR)/part_10.mp4 $(BUILD_DIR)/part_11.mp4
	bash gen_video.sh

# $(BUILD_DIR)/part_1.mp4: part/*
# 	cd part && bash gen_part.sh 1 $(STREAM_START_1) $(STREAM_END_1)

# $(BUILD_DIR)/part_2.mp4: part/*
# 	cd part && bash gen_part.sh 2 $(STREAM_START_2) $(STREAM_END_2)

# $(BUILD_DIR)/part_3.mp4: part/*
# 	cd part && bash gen_part.sh 3 $(STREAM_START_3) $(STREAM_END_3)

# $(BUILD_DIR)/part_4.mp4: part/*
# 	cd part && bash gen_part.sh 4 $(STREAM_START_4) $(STREAM_END_4)

# $(BUILD_DIR)/part_5.mp4: part/*
# 	cd part && bash gen_part.sh 5 $(STREAM_START_5) $(STREAM_END_5)

# $(BUILD_DIR)/part_6.mp4: part/*
# 	cd part && bash gen_part.sh 6 $(STREAM_START_6) $(STREAM_END_6)

# $(BUILD_DIR)/part_7.mp4: part/*
# 	cd part && bash gen_part.sh 7 $(STREAM_START_7) $(STREAM_END_7)

# $(BUILD_DIR)/part_8.mp4: part/*
# 	cd part && bash gen_part.sh 8 $(STREAM_START_8) $(STREAM_END_8)

# $(BUILD_DIR)/part_9.mp4: part/*
# 	cd part && bash gen_part.sh 9 $(STREAM_START_9) $(STREAM_END_9)

# $(BUILD_DIR)/part_10.mp4: part/*
# 	cd part && bash gen_part.sh 10 $(STREAM_START_10) $(STREAM_END_10)

# $(BUILD_DIR)/part_11.mp4: part/*
# 	cd part && bash gen_part.sh 11 $(STREAM_START_11) $(STREAM_END_11)
