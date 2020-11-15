ffmpeg -ss 00:06:23 -i ../input/popular-gemology-27-9-2018-011.mov\
       -ss 00:01:42 -i ../input/madrid.rbmio.mov \
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 01:07:46 \
       -map "[v]" -map "[a]" \
       -y ../output/build/video.mp4
