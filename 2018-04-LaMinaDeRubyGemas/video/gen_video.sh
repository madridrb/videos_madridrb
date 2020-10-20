ffmpeg -ss 00:02:11 -i ../input/3.5.2018-002.mov\
       -ss 00:04:00 -i ../input/madridrb.mov \
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 00:42:25 \
       -map "[v]" -map "[a]" \
       -y ../output/build/video.mp4
