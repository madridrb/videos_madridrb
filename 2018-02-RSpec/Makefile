output/full_video.mp4: output/build gen_full_video.sh output/build/cover.mp4 output/build/title.mp4 output/build/sponsors.mp4 output/build/video.mp4
	bash gen_full_video.sh

output/build/video.mp4: output/build gen_video.sh video_script input/*
	bash gen_video.sh

output/build/sponsors.mp4: output/build gen_sponsors.sh sponsors_script ../shared/sponsors*.png
	bash gen_sponsors.sh

output/build/title.mp4: output/build gen_title.sh title_script title_text.txt speaker_text.txt
	bash gen_title.sh

output/build/cover.mp4: output/build gen_cover.sh cover_script cover_text.txt date_text.txt
	bash gen_cover.sh

output/build: output
	mkdir -p output/build

output:
	mkdir -p output
