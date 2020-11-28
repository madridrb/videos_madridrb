ffmpeg -ss 00:09:14 -i ../input/dockeriza-tu-rails-speaker.mov\
       -ss 00:12:59.5 -i ../input/MadridRBEnero2019-slides.mov \
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 00:39:17 \
       -map "[v]" -map "[a]" \
       -y ../output/build/video.mp4
