ruby video_script.rb > video_script

ffmpeg -ss $STREAM_START -t $STREAM_DURATION -i ../input/obs_stream.mkv\
       -ss $AUDIO_START -t $STREAM_DURATION -i ../input/google_meet_recording.mp4\
       -filter_complex_script video_script \
       -t $STREAM_DURATION \
       -map "[v]" -map "[a]" \
       -r 25 \
       -ar 48000 \
       -y ../output/build/video.mp4
