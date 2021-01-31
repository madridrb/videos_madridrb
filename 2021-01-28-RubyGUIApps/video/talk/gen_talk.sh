ruby video_script.rb > video_script

ffmpeg -ss $STREAM_START -i ../../input/obs_stream.mkv\
       -filter_complex_script video_script \
       -t $STREAM_DURATION \
       -map "[v]" -map "[a]" \
       -r 25 \
       -y ../../output/build/talk.mp4
