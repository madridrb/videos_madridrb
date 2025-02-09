ffmpeg -f concat \
       -safe 0 \
       -i full_video_parts.txt \
       -c copy \
       -y ../output/full_video.mp4
