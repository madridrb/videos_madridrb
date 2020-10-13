ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=20 \
       -i ../shared/sponsors1.png \
       -i ../shared/sponsors2.png \
       -i ../shared/sponsors3.png \
       -i ../shared/sponsors4.png \
       -f lavfi -t 0.1 -i anullsrc \
       -filter_complex_script sponsors_script \
       -map "[v]" -map "[a]" \
       -y output/build/sponsors.mp4
