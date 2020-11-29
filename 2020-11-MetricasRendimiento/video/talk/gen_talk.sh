ffmpeg -ss 00:13:11 -i ../../input/obs_stream_speaker.mkv\
       -i ../../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 50:16 \
       -map "[v]" -map "[a]" \
       -y ../../output/build/talk.mp4
