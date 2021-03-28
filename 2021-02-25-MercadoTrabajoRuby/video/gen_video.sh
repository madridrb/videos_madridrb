ffmpeg -f concat \
       -safe 0 \
       -i video_parts.txt \
       -c copy \
       -y ../output/build/video.mp4
