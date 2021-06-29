require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$duration = parse_env_timestamp('PART_DURATION')

res = <<-FFMPEG
[1:a] afade=t=in:d=1, afade=out:d=1:st=#{$duration - 1} [fsound0];
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [fvideo0];
[fvideo0][fsound0] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
