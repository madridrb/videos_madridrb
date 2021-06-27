ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=20 \
       -i ../../shared/2021/sponsors1.png \
       -i ../../shared/2021/sponsors2.png \
       -i ../../shared/2021/sponsors4.png \
       -i ../../shared/2021/sponsors5.png \
       -f lavfi -t 20 -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script sponsors_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/sponsors.mp4
