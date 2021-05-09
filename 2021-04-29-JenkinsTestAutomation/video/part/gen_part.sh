PART_NUMBER=$1
PART_START=$2
PART_END=$3
MEET_DIFF=$4

export PART_NUMBER
export PART_START
export PART_END
export MEET_DIFF

PART_DURATION=$($SCRIPT_LIB_DIR/ffmpeg_time_diff $PART_END $PART_START)
AUDIO_START=$($SCRIPT_LIB_DIR/ffmpeg_time_sum $PART_START $MEET_DIFF)

export PART_DURATION

ruby part_script.rb > part_script

ffmpeg -ss $PART_START -t $PART_DURATION -i ../../input/obs_stream.mkv\
       -ss $AUDIO_START -t $PART_DURATION -i ../../input/google_meet_recording.mp4\
       -filter_complex_script part_script \
       -t $PART_DURATION \
       -map "[v]" -map "[a]" \
       -r 25 \
       -ar 48000 \
       -y ../output/build/part_$PART_NUMBER.mp4
