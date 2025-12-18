require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$start = parse_env_timestamp('PART_START')
$duration = parse_env_timestamp('PART_DURATION')

res = <<-FFMPEG
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [origvideo];
[0:a] afade=in:st=0:d=1, afade=out:d=1:st=#{$duration - 1} [origsound];

[origvideo][origsound] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
