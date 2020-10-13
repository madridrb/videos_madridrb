ffmpeg -f concat \
       -safe 0 \
       -i full_video_parts.txt \
       -c copy \
       -y output/full_video.mp4

# ffmpeg -i output/build/cover.mp4 \
#        -i output/build/title.mp4 \
#        -i output/build/sponsors.mp4 \
#        -i output/build/video.mp4 \
#        -f lavfi -t 0.1 -i anullsrc \
#        -filter_complex_script full_video_script \
#        -map "[v]" -map "[a]" \
#        -y output/full_video.mp4
