PART_NUMBER=$1
PART_START=$2
PART_END=$3
CAMERA_DIFF=$4

export PART_NUMBER
export PART_START
export PART_END
export CAMERA_DIFF

PART_DURATION=$($SCRIPT_LIB_DIR/ffmpeg_time_diff $PART_END $PART_START)
CAMERA_START=$($SCRIPT_LIB_DIR/ffmpeg_time_sum $PART_START $CAMERA_DIFF)

export PART_DURATION

echo $PART_START
echo $PART_END
echo $CAMERA_DIFF

ruby part_script.rb > part_script

ffmpeg -ss $PART_START -t $PART_DURATION -i ../../input/2025-11-27-RubyGemInRust.mkv\
       -filter_complex_script part_script \
       -t $PART_DURATION \
       -map "[v]" -map "[a]" \
       -r 25 \
       -ar 48000 \
       -ac 2 \
       -loglevel verbose \
       -y ../output/build/part_$PART_NUMBER.mp4

