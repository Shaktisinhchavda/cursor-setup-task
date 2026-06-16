# YouTube Collection Log

Date: 2026-06-16

## What Was Tested

Public YouTube pages were tested for:

- Channel handle availability
- Public metadata extraction
- Caption track discovery on individual videos
- Public transcript endpoint access

## Findings

- Some channel handles are publicly reachable, including `@HubSpotHacks`, `@FoundationInc`, `@ExitFive`, `@TheReeder`, `@Vidyard`, `@SamDunning`, `@wistia`, and `@TKKader`.
- Generic YouTube search for "B2B SaaS YouTube content strategy" returned several low-signal results, so the expert list was not built from generic search results.
- A public transcript endpoint was tested with a B2B YouTube strategy video, but the endpoint returned a blocking message instead of transcript text.
- YouTube watch pages can expose caption track metadata for some videos, but direct timedtext transcript fetches may return empty content depending on request/signature behavior.

## Transcript Endpoint Test

Tested endpoint pattern:

```text
https://youtubetranscript.com/?server_vid2={VIDEO_ID}
```

Observed result:

```text
YouTube is currently blocking us from fetching subtitles.
```

## Next Collection Step

Use a more reliable transcript method:

- Supadata transcript API
- Official YouTube Data API plus caption access where authorized
- Manual transcript export from YouTube when available
- Browser-based copy of transcript text for selected high-value videos
