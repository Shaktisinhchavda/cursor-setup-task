# Transcript Fetch Attempts Summary

Date: 2026-06-16

Script used:

```text
tools/test-youtube-transcripts.ps1
```

Output generated:

```text
research/other/transcript-fetch-attempts.csv
```

## Result

The script attempted to access caption metadata and timed-text transcript endpoints for the 10 selected transcript targets. In this environment, transcript endpoint requests returned `404 Not Found`, so transcript text was not collected in this batch.

## Interpretation

This does not mean the videos are bad research targets. They were selected from public YouTube RSS metadata, but direct transcript access can fail because of:

- video availability changes
- regional access differences
- YouTube request restrictions
- caption URLs requiring browser context, signed parameters, or a transcript API

## Next Practical Step

This was followed up with the `youtube-transcript` npm package via `tools/collect-youtube-transcripts.js`.

Result:

- 9 of 10 selected transcripts were collected.
- Results are logged in `research/other/youtube-transcript-api-results.csv`.
- Transcript files are stored in `research/youtube-transcripts/collected/`.
