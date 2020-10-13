ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=5 \
       -f lavfi -t 0.1 -i anullsrc \
       -filter_complex_script cover_script \
       -map "[v]" -map "[a]" \
       -y output/build/cover.mp4


