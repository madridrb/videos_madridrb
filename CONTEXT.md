# Madrid.rb Video Processing - Context Document

## Repository Purpose

This repository contains video postprocessing workflows for Madrid.rb (Ruby users group) meetup recordings. Each dated folder represents one meetup session that needs to be transformed from raw recordings into publish-worthy videos with branding, credits, and sponsor acknowledgments.

## Directory Structure

```
videos_madridrb/
├── lib/                    # Ruby helper utilities for ffmpeg
├── shared/                 # Common resources (logos, fonts, sponsor images)
│   ├── 2021/, 2022/, 2025/ # Year-specific sponsor compositions
│   └── logo_*.png          # Individual sponsor and group logos
├── YYYY-MM-DD-Topic/       # Individual meetup folders (one per session)
│   ├── README.md           # Session-specific details and editing notes
│   ├── Makefile            # Main build orchestration
│   ├── input/              # Raw video files (symlinked, not in repo)
│   ├── output/             # Generated files (symlinked, not in repo)
│   ├── cover/              # Cover generation scripts
│   ├── title/              # Title screen generation
│   ├── sponsors/           # Sponsor acknowledgment generation
│   ├── credits/            # End credits generation
│   ├── video/              # Main video processing
│   │   ├── Makefile        # Video-specific build rules
│   │   ├── gen_video.sh    # Concatenation script
│   │   ├── banners.rb      # Optional overlay text configuration
│   │   └── part/           # Individual part generation
│   │       ├── gen_part.sh      # ffmpeg invocation script
│   │       ├── part_script.rb   # Ruby generator for complex filter
│   │       ├── part_script      # Generated ffmpeg filter (created by Ruby)
│   │       └── *.txt            # Text content for overlays
│   └── full_video/         # Final video composition
└── README.md               # Repository overview
```

## Build Workflow

### Standard Process

1. **Setup**: Create `input/` and `output/` folders (typically symlinked to external storage)
2. **Place raw assets**: Copy source video files to `input/`
3. **Run make**: Execute `make` in the meetup folder
4. **Output**: Final video generated as `output/full_video.mp4`

### Build Pipeline

The Makefile orchestrates several steps in dependency order:

1. **video** → Process raw footage with overlays/compositions (`output/build/video.mp4`)
2. **cover** → Generate opening cover screen (`output/build/cover.mp4`)
3. **title** → Generate title card (`output/build/title.mp4`)
4. **sponsors** → Generate sponsor acknowledgment section (`output/build/sponsors.mp4`)
5. **credits** → Generate closing credits (`output/build/credits.mp4`)
6. **full_video** → Concatenate all parts into final deliverable (`output/full_video.mp4`)

Make's dependency tracking means you can edit individual components and re-run `make` to rebuild only affected parts.

## 2025 Meetups Overview

### Recording Venue Patterns

#### Professional Studio (SNGULAR HUB)
**Meetups**: Jan 30 (SolidQueue), Mar 27 (TimescaleDB), May 29 (LLMs Roundtable)

**Characteristics**:
- Single pre-produced video file
- 1920x1080 @ 50fps
- AAC audio @ 48KHz 32bps
- Professional recording, production, and Twitch streaming included
- Minimal postprocessing needed (mainly adding branding overlays)

**Workflow**: Simplest - mostly adding Madrid.rb branding frame around the studio-produced content.

#### Self-Managed with OBS (Lingokids venues)
**Meetups**: Feb 27 (PubSub), Apr 24 (Madrid.rb + Elixir Madrid), Oct 30 (OpenFGA)

**Characteristics**:
- Multiple raw sources:
  - Video camera recording (1920x1080 @ 25fps, 48KHz audio)
  - Screen capture via QuickTime (1920x1200 @ 60fps)
  - HDMI capture cards → OBS laptop
  - OBS output (composite recording + Twitch stream)
- Complex multi-source synchronization required

**Challenges Encountered**:
- **Feb 27**: Audio glitches in OBS recording, face-tracking markers in HDMI feed
  - Solution: Use camera audio + camera video overlay to fix
- **Apr 24**: Improved USB connection strategy, canvas upscaling for better text rendering
  - Canvas: 2880x1620 with bicubic scaling → 1920x1080 output
  - Better USB port allocation for camera source

**Workflow**: More complex - requires synchronizing multiple sources and replacing/overlaying problematic streams.

### Incomplete Folder
**Apr 24 (Madrid.rb + Elixir Madrid)**: README truncated, appears to be work in progress.

## Technical Components

### Ruby Helper Library (`lib/ffmpeg_utils.rb`)

Provides utilities to generate complex ffmpeg filter syntax:

- **Time manipulation**:
  - `parse_timestamp(time_str)` - Convert "HH:MM:SS" to seconds
  - `parse_env_timestamp(var)` - Parse timestamp from environment variable

- **Path helpers**:
  - `shared_folder`, `fonts_folder`, `default_font` - Common resource locations

- **Filter generators**:
  - `banner(textfile, start_t, end_t, options)` - Overlay text with fade in/out
  - `simple_frame(video_stream, logo_stream, left_text, right_text)` - Standard framing with branding

### Shell Time Utilities (`lib/`)

- `ffmpeg_time` - Time format conversion
- `ffmpeg_time_diff` - Calculate duration between timestamps
- `ffmpeg_time_sum` - Add time offsets (for sync correction)

### Complex Filter Generation Pattern

Each `video/part/` folder contains:

1. **part_script.rb**: Ruby script that generates ffmpeg complex filter
   - Reads environment variables (PART_START, PART_DURATION, etc.)
   - Uses helper functions from `ffmpeg_utils.rb`
   - Outputs filter graph to stdout

2. **gen_part.sh**: Bash script that:
   - Calculates timing offsets using lib utilities
   - Runs `part_script.rb > part_script` to generate filter
   - Invokes ffmpeg with `-filter_complex_script part_script`
   - Maps input sources (video files, logos, etc.) to filter inputs

Example pattern:
```bash
# Calculate offsets
PART_DURATION=$(ffmpeg_time_diff $PART_END $PART_START)

# Generate complex filter
ruby part_script.rb > part_script

# Apply filter
ffmpeg -ss $START -t $DURATION \
       -i ../../input/source.mp4 \
       -i ../../../shared/logo.png \
       -filter_complex_script part_script \
       -map "[v]" -map "[a]" \
       -y output.mp4
```

### Common Editing Operations

**Video Framing**:
- Black 1920x1080 background
- Scaled video content (typically h=900-1040)
- Madrid.rb logo overlay
- Info text overlays (title, speaker, date, social media)
- Rotating sponsor logos (4-second intervals)

**Audio Processing**:
- Audio/video fade in/out (typically 1 second)
- Stereo downmixing when needed
- Synchronization offset correction (MEET_DIFF/CAMERA_DIFF variables)

**Timing Corrections**:
- Trim start/end silence or setup time
- Sync multiple sources (camera vs screencast timing differences)
- Multi-segment concatenation (when camera splits files)

## Key Patterns by Meetup Type

### Studio-Produced (Simple)
**Examples**: 2025-01-30, 2025-03-27, 2025-05-29

- Single input video
- Simple frame overlay with branding
- Main work: trimming start/end points

### Multi-Source Composite (Complex)
**Examples**: 2025-02-27, 2025-10-30

- Camera + screen capture synchronization
- Audio source selection/replacement
- Video overlay composition
- More complex part_script.rb with multiple input streams

## Shared Resources

### Logos
- `madridrb-logo.png` - Group logo
- `logo_sngular.png`, `logo_lingokids.png`, etc. - Sponsor logos

### Fonts
- `shared/fonts/arial-black_allfont_net.ttf` - Default font for text overlays

### Sponsor Compositions (by year)
- `shared/2025/sponsors-sngular-lingokids.png` - Pre-composed sponsor slides
- Format: Combined sponsor logo layouts ready for video use

## Important Notes

### File Organization
- **Input/output folders**: Typically symlinked to external storage (not in repo)
- **Raw video files**: Never committed to git (too large)
- **Generated filters**: `part_script` is generated, not hand-written

### Editing Notes in READMEs
Each meetup README contains critical information:
- Total duration of raw footage
- Start/end timestamps for trimming
- Video specifications (resolution, framerate, audio format)
- Synchronization offsets between sources
- Known issues and workarounds

### Incremental Builds
Make's dependency tracking allows:
- Edit a text file → Rebuild just that section
- Modify timestamps → Rebuild affected parts
- Change filter logic → Rebuild video processing

### Common Variations

1. **Single vs Multiple Parts**: Some videos split into multiple segments (gen_part.sh called multiple times)
2. **Banner overlays**: Optional text overlays defined in `banners.rb` (often commented out)
3. **Sponsor display**: Varies between rotating individual logos vs. static composed slides
4. **Frame complexity**: From simple border to complex composites with multiple video sources

## Working with These Folders

### To Process a New Video

1. Read the meetup's README.md for specifics
2. Check video specifications and editing notes
3. Ensure input files match expected names
4. Create input/output directories
5. Run `make` and monitor for errors
6. Review timings and adjust if needed

### To Modify an Existing Setup

1. For timing changes: Edit Makefile timestamp variables
2. For text content: Edit .txt files in relevant folders
3. For filter changes: Edit part_script.rb
4. For layout changes: Modify Ruby filter generators
5. Run `make` - only affected parts rebuild

### Debugging Tips

- Check `ffmpeg -loglevel verbose` output for filter errors
- Review generated `part_script` file for filter syntax
- Test individual make targets (e.g., `make output/build/video.mp4`)
- Verify input file paths and symlinks
- Check environment variable exports in shell scripts

## Technology Stack

- **ffmpeg**: Video/audio processing engine
- **Make**: Build orchestration and dependency management
- **Ruby**: Complex filter generation and text manipulation
- **Bash**: Glue scripts for time calculations and ffmpeg invocation
- **OBS** (when self-recording): Real-time composition and streaming
