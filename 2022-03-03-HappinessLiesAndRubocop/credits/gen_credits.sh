ruby credits_script.rb > credits_script

ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=5 \
       -f lavfi -t 5 -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script credits_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/credits.mp4


