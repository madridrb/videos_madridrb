require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$stream_start = parse_env_timestamp('PART_START')
$stream_end = parse_env_timestamp('PART_END')
$duration = $stream_end - $stream_start

res = <<-FFMPEG
[0:a] afade=t=in:d=3, afade=out:d=1:st='#{$duration - 1}' [fsound];
[0] fade=in:st=0:d=1, fade=out:d=1:st='#{$duration - 1}' [fvideo];
[fvideo][fsound] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
