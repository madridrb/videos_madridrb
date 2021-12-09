require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$duration = parse_env_timestamp('PART_DURATION')

res = <<-FFMPEG
[0:a] afade=t=in:d=1, afade=out:d=1:st=#{$duration - 1} [fsound0];
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [origvideo];
 #{simple_frame("origvideo", "1", "bottom_text_left.txt", "bottom_text_right.txt")}
[simple_frame_final_frame][fsound0] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
