ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=5 \
       -filter_complex_script cover_script \
       output/cover.mp4

