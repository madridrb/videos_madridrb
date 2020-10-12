ffmpeg -r 1/5 \
       -i ../shared/sponsors%01d.png \
       -c:v libx264 \
       -pix_fmt yuv420p \
       -r 30 \
       output/start.mp4


