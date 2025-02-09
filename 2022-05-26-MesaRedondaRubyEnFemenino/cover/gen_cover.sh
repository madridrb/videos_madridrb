ruby cover_script.rb > cover_script

ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=5 \
       -f lavfi -t 5 -i anullsrc=r=48000:cl=stereo \
       -i ../../shared/madridrb-logo.png \
       -filter_complex_script cover_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/cover.mp4


