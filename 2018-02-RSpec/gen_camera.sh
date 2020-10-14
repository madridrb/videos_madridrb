ffmpeg -f concat \
       -safe 0 \
       -i camera_parts.txt \
       -c copy \
       -y output/build/camera.MTS
