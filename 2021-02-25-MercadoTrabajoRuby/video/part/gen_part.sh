PART_NUMBER=$1
PART_START=$2
PART_END=$3
export PART_NUMBER
export PART_START
export PART_END

PART_DURATION=$($SCRIPT_LIB_DIR/ffmpeg_time_diff $PART_END $PART_START)
export PART_DURATION

ruby part_script.rb > part_script

ffmpeg -ss $PART_START -i ../../input/obs_stream.mkv\
       -filter_complex_script part_script \
       -t $PART_DURATION \
       -map "[v]" -map "[a]" \
       -r 25 \
       -y ../output/build/part_$PART_NUMBER.mp4
