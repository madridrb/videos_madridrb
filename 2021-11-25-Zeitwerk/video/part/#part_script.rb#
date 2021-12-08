require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$duration = parse_env_timestamp('PART_DURATION')

res = <<-FFMPEG
[0:a] afade=t=in:d=1, afade=out:d=1:st=#{$duration - 1} [fsound0];
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [origvideo];
color=black:s=1920x1080 [bg];
[1]scale=w=-1:h=30 [logo];
[bg][logo] overlay=30:main_h-overlay_h-5 [bglogo];
[origvideo]scale=w=-1:h=1040 [stream];
[bglogo][stream] overlay=main_w/2-overlay_w/2:0 [composite];
[composite] drawtext=textfile=bottom_text_left.txt:fontcolor=0x888888:fontsize=14:x=80:y=h-25:fontfile=#{default_font} [composite-text-1];
[composite-text-1] drawtext=textfile=bottom_text_right.txt:fontcolor=0x888888:fontsize=14:x=w-text_w-35:y=h-25:fontfile=#{default_font} [fvideo];
[fvideo][fsound0] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
