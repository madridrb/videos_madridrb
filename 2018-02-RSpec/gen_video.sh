ffmpeg -ss 00:05:42 -i input/00005-008.MTS\
       -ss 00:05:15 -i input/out1.ogv \
       -filter_complex_script video_script \
       -shortest \
       -y output/build/video.mp4


