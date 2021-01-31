require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$stream_start = parse_env_timestamp('STREAM_START')
$stream_end = parse_env_timestamp('STREAM_END')
$duration = $stream_end - $stream_start

$banner_1_start = parse_env_timestamp('BANNER_1_START') - $stream_start
$banner_1_end = parse_env_timestamp('BANNER_1_END') - $stream_start

res = <<-FFMPEG
[0:a] afade=t=in:d=3, afade=out:d=1:st='#{$duration - 1}' [fsound];
[0] #{banner('banner1_text.txt', $banner_1_start, $banner_1_end)} [tfinal];
[tfinal] fade=in:st=0:d=1, fade=out:d=1:st='#{$duration - 1}' [fvideo];
[fvideo][fsound] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
