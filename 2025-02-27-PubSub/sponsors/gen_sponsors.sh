ffmpeg -f lavfi -i color=size=$OUTPUT_RES:color=black:d=20 \
       -i ../../shared/2025/sponsors-thecocktail-bebanjo.png \
       -i ../../shared/2025/sponsors-jobfluent-getro.png \
       -i ../../shared/2025/sponsors-marketer-rubycentral.png \
       -i ../../shared/2025/sponsors-sngular.png \
       -f lavfi -t 20 -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script sponsors_script \
       -map "[v]" -map "[a]" \
       -y ../output/build/sponsors.mp4
