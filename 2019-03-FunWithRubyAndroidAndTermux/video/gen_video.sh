ffmpeg -ss 00:03:26 -i ../input/fun-ruby-android-termux-speaker.mov\
       -ss 00:11:55 -i ../input/MadridRB.mov \
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 01:06:41 \
       -map "[v]" -map "[a]" \
       -y ../output/build/video.mp4
