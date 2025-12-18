ruby title_script.rb > title_script

ffmpeg -f lavfi -i color=size=$OUTPUT_RES:color=black:d=5 \
       -f lavfi -t 5 -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script title_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/title.mp4


