ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=15 \
       -i ../../shared/2021/sponsors1.png \
       -i ../../shared/2021/sponsors2.png \
       -i ../../shared/2021/sponsors4.png \
       -f lavfi -t 15 -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script sponsors_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/sponsors.mp4
