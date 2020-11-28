ffmpeg -ss 00:00:13.5 -i ../input/Madrid.rb_Abril_2020.mp4\
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script video_script \
       -t 01:13:20.5 \
       -map "[v]" -map "[a]" \
       -y ../output/build/video.mp4
