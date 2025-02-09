require_relative File.join(ENV['SCRIPT_LIB_DIR'], 'ffmpeg_utils')
require_relative '../banners';

$start = parse_env_timestamp('PART_START')
$duration = parse_env_timestamp('PART_DURATION')

def apply_banners(source_stamp, dest_stamp)
  return "[#{source_stamp}] copy [#{dest_stamp}];" if $banners.empty?
  
  $banners.map.with_index do |ban, idx|
    left_stamp = idx == 0 ? source_stamp : "banner_#{idx}"
    right_stamp = idx + 1 == $banners.length ? dest_stamp : "banner_#{idx + 1}"
    banner_file = "../#{ban[:textfile]}"
    start_timestamp = parse_timestamp(ban[:start]) - $start
    end_timestamp = start_timestamp + parse_timestamp(ban[:duration])
    banner_command = banner(banner_file, start_timestamp, end_timestamp)
    "[#{left_stamp}] #{banner_command} [#{right_stamp}];"
  end.join("\n")
end

res = <<-FFMPEG
[0:a] afade=t=in:d=1, afade=out:d=1:st=#{$duration - 1} [fsound0];
[0:v] fade=in:st=0:d=1, fade=out:d=1:st=#{$duration - 1} [origvideo];

color=black:s=1920x1080 [simple_frame_bg];
[1]scale=w=-1:h=120 [simple_frame_logo];
[simple_frame_bg][simple_frame_logo] overlay=main_w-150-overlay_w/2:10 [simple_frame_bglogo];
[origvideo]scale=w=-1:h=900 [simple_frame_stream];
[simple_frame_bglogo][simple_frame_stream] overlay=10:10 [simple_frame_composite];

[simple_frame_composite] drawtext=textfile=./title_text.txt:fontcolor=0xffffff:fontsize=36:x=10:y=930:fontfile=#{default_font} [simple_frame_composite-text-1];
[simple_frame_composite-text-1] drawtext=textfile=./speaker_text.txt:fontcolor=0xaaaaaa:fontsize=18:x=10:y=970:fontfile=#{default_font} [simple_frame_composite-text-2];
[simple_frame_composite-text-2] drawtext=textfile=../../cover/date_text.txt:fontcolor=0x880000:fontsize=16:x=10:y=1000:fontfile=#{default_font} [simple_frame_composite-text-3];

[simple_frame_composite-text-3] drawtext=textfile=../../cover/cover_text.txt:fontcolor=0xffffff:fontsize=42:x=main_w-150-text_w/2:y=140:fontfile=#{default_font} [simple_frame_composite-text-4];
[simple_frame_composite-text-4] drawtext=text='Grupo de Ruby de Madrid':fontcolor=0xaaaaaa:fontsize=20:x=main_w-150-text_w/2:y=180:fontfile=#{default_font} [simple_frame_composite-text-5];

[simple_frame_composite-text-5] drawtext=text='www.madridrb.com':fontcolor=0x285FED:fontsize=24:x=main_w-150-text_w/2:y=260:fontfile=#{default_font} [simple_frame_composite-text-6];
[simple_frame_composite-text-6] drawtext=text='@madridrb':fontcolor=0x285FED:fontsize=24:x=main_w-150-text_w/2:y=320:fontfile=#{default_font} [simple_frame_composite-text-7];

[simple_frame_composite-text-7] drawtext=text='Ofrecido por':fontcolor=0xffffff:fontsize=24:x=main_w-150-text_w/2:y=900:fontfile=#{default_font} [simple_frame_composite-text-8];

[2]scale=h=-1:w=272 [sponsor_logo_1];
[simple_frame_composite-text-8][sponsor_logo_1] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,0\\,4) [simple_frame_sponsorlogo_1];
[3]scale=h=-1:w=272 [sponsor_logo_2];
[simple_frame_sponsorlogo_1][sponsor_logo_2] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,4\\,8) [simple_frame_sponsorlogo_2];
[4]scale=h=-1:w=272 [sponsor_logo_3];
[simple_frame_sponsorlogo_2][sponsor_logo_3] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,8\\,12) [simple_frame_sponsorlogo_3];
[5]scale=h=-1:w=272 [sponsor_logo_4];
[simple_frame_sponsorlogo_3][sponsor_logo_4] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,12\\,16) [simple_frame_sponsorlogo_4];
[6]scale=h=-1:w=272 [sponsor_logo_5];
[simple_frame_sponsorlogo_4][sponsor_logo_5] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,16\\,20) [simple_frame_sponsorlogo_5];
[7]scale=h=-1:w=272 [sponsor_logo_6];
[simple_frame_sponsorlogo_5][sponsor_logo_6] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,20\\,24) [simple_frame_sponsorlogo_6];
[8]scale=h=-1:w=272 [sponsor_logo_7];
[simple_frame_sponsorlogo_6][sponsor_logo_7] overlay=main_w-150-overlay_w/2:940:enable=between(mod(t\\,28)\\,24\\,28) [frame_with_sponsors];

#{apply_banners('frame_with_sponsors', 'frame_with_banners')}

[frame_with_banners][fsound0] concat=n=1:v=1:a=1 [v][a]
FFMPEG

puts res
