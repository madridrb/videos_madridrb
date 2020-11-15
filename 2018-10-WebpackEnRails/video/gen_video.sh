ffmpeg -ss 00:00:28 -i ../input/2018-10-WebpackEnRails-camera.mov\
       -ss 00:00:14 -i ../input/madridrb_oct_2018.mov \
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 00:45:36 \
       -map "[v]" -map "[a]" \
       -y ../output/build/video.mp4
