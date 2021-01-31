ruby qa_script.rb > qa_script

ffmpeg -ss $QA_START_1 -t $QA_DURATION_1 -i ../../input/obs_stream.mkv\
       -ss $QA_AUDIO_START_1 -t $QA_DURATION_1 -i ../../input/google_meet_recording.mp4\
       -ss $QA_START_2 -t $QA_DURATION_2 -i ../../input/obs_stream.mkv\
       -ss $QA_AUDIO_START_2 -t $QA_DURATION_2 -i ../../input/google_meet_recording.mp4\
       -i ../../input/alfonso_alba_sketch.png\
       -f lavfi -i color=size=1920x1080:color=black:d=$QA_SKETCH_DURATION \
       -f lavfi -t $QA_SKETCH_DURATION -i anullsrc=r=48000:cl=stereo \
       -filter_complex_script qa_script \
       -t $QA_TOTAL_DURATION \
       -map "[v]" -map "[a]" \
       -r 25 \
       -ar 48000 \
       -y ../../output/build/qa.mp4
