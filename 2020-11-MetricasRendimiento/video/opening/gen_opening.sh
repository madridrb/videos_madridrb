ffmpeg -ss 00:06:01 -i ../../input/obs_stream_host.mkv\
       -filter_complex_script video_script \
       -t 06:09 \
       -map "[v]" -map "[a]" \
       -r 25 \
       -y ../../output/build/opening.mp4
