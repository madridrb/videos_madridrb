ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=5 \
       -f lavfi -t 5 -i anullsrc=r=44100:cl=stereo \
       -filter_complex_script title_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/title.mp4


