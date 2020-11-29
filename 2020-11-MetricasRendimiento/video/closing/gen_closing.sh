ffmpeg -ss 01:04:40 -t 13 -i ../../input/obs_stream_host.mkv\
       -ss 01:08:04 -t 805 -i ../../input/obs_stream_host.mkv\
       -filter_complex_script video_script \
       -t 13:38 \
       -map "[v]" -map "[a]" \
       -r 25 \
       -y ../../output/build/closing.mp4
