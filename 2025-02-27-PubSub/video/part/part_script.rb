require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$start = parse_env_timestamp('PART_START')
$duration = parse_env_timestamp('PART_DURATION')

res = <<-FFMPEG
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [origvideo];
[1:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [cameravideo];
[1:a] afade=in:st=0:d=1, afade=out:d=1:st=#{$duration - 1} [camerasound];
[camerasound] pan=stereo|FL<FL+0.5*FC+0.6*BL+0.3*LFE|FR<FR+0.5*FC+0.6*BR+0.3*LFE [sound_in_stereo];
[cameravideo]scale=w=-1:h=180 [scaledcameravideo];
[origvideo][scaledcameravideo] overlay=0:main_h-overlay_h [videowithupdatedcamera];

[videowithupdatedcamera][sound_in_stereo] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
