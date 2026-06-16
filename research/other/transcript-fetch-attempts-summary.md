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

The script attempted to access the public YouTube watch pages for the 10 selected transcript targets. In this environment, those direct watch-page requests returned `404 Not Found`, so transcript text was not collected in this batch.

## Interpretation

This does not mean the videos are bad research targets. They were selected from public YouTube RSS metadata, but direct transcript access can fail because of:

- video availability changes
- regional access differences
- YouTube request restrictions
- caption access requiring browser context or a transcript API

## Next Practical Step

Use one of these methods for the next batch:

- Supadata transcript API
- YouTube transcript copy from the browser
- another authenticated transcript service
- manual transcript export for the highest-value videos

Until transcript text is actually collected, these files should remain metadata and collection logs only.
