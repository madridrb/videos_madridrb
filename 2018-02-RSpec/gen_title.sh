ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=5 \
       -filter_complex_script title_script \
       -y output/build/title.mp4


