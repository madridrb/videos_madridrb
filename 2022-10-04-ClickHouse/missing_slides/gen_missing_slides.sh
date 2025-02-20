ffmpeg -f lavfi -i color=size=1920x1080:color=black:d=38 \
       -i ../input/slides/slide-00.png \
       -i ../input/slides/slide-01.png \
       -i ../input/slides/slide-02.png \
       -i ../input/slides/slide-03.png \
       -i ../input/slides/slide-04.png \
       -i ../input/slides/slide-05.png \
       -i ../input/slides/slide-06.png \
       -i ../input/slides/slide-07.png \
       -i ../input/slides/slide-08.png \
       -i ../input/slides/slide-09.png \
       -i ../input/slides/slide-10.png \
       -i ../input/slides/slide-11.png \
       -i ../input/slides/slide-12.png \
       -i ../input/slides/slide-13.png \
       -f lavfi -t 38 -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script missing_slides_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/missing_slides.mp4
