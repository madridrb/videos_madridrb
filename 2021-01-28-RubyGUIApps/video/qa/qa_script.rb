require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')

$qa_duration_1 = parse_env_timestamp('QA_DURATION_1')
$qa_duration_2 = parse_env_timestamp('QA_DURATION_2')
$qa_sketch_duration = parse_env_timestamp('QA_SKETCH_DURATION')

res = <<-FFMPEG
[2] crop=356:254:753:90, boxblur=10 [blurredchild];
[2][blurredchild] overlay=x=753:y=90 [composed];
[composed] copy [fixed2];
[4] scale=w=1920:h=-1 [skbase];
[5][skbase] overlay=0:main_h-overlay_h [skclip];
[skclip] #{banner('sketch_text.txt', 1.5, $qa_sketch_duration)} [skclipf];
[1:a] afade=t=in:d=1, afade=out:d=1:st=#{$qa_duration_1 - 1} [fsound0];
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$qa_duration_1 - 1} [fvideo0];
[3:a] afade=t=in:d=1, afade=out:d=1:st=#{$qa_duration_2 - 1} [fsound1];
[fixed2] fade=in:st=0:d=1, fade=out:d=1:st=#{$qa_duration_2 - 1} [fvideo1];
[6:a] afade=t=in:d=1, afade=out:d=1:st=#{$qa_sketch_duration - 1} [sksound];
[skclipf] fade=in:st=0:d=1, fade=out:d=1:st=#{$qa_sketch_duration - 1} [skvideo];
[fvideo0][fsound0][fvideo1][fsound1][skvideo][sksound] concat=n=3:v=1:a=1 [v][a]
FFMPEG

puts res
