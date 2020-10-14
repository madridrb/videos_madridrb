ffmpeg -ss 00:05:42 -i ../output/build/camera.MTS\
       -ss 00:05:15 -i ../input/out1.ogv \
       -filter_complex_script video_script \
       -t 1:02:52 \
       -y ../output/build/video.mp4
