ffmpeg -r 1/5 \
       -i ../shared/sponsors%01d.png \
       -c:v libx264 \
       -pix_fmt yuv420p \
       -r 25 \
       -y output/build/sponsors.mp4


