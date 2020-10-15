ffmpeg -ss 00:10:19 -i ../input/webrtc_camera.mov\
       -ss 00:03:32 -i ../input/webrtc_slides.mov \
       -filter_complex_script video_script \
       -t 00:43:47 \
       -y ../output/build/video.mp4
