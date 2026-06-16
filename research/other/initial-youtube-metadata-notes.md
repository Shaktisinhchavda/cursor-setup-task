# Initial YouTube Metadata Notes

Date collected: 2026-06-16

Generated files:

- `research/other/youtube-handle-check.csv`
- `research/other/youtube-latest-videos.csv`

Collector script:

- `tools/collect-youtube-metadata.ps1`

## What This Batch Proves

This batch verifies that public YouTube metadata can be collected without manually copying every channel URL. The script checks selected handles, extracts channel IDs from public YouTube pages, and pulls recent uploads from YouTube RSS feeds where available.

## Strongest Initial Video Sources

Based on the first RSS pull, the strongest initial transcript targets are:

- HubSpot Hacks: practical SaaS tutorial videos with clear search intent
- Sam Dunning: SaaS SEO and content-led acquisition videos
- Wistia: B2B video marketing and repurposing content
- TK Kader: SaaS founder-led YouTube and go-to-market videos
- Directive Consulting: B2B SaaS marketing and demand generation content
- Cognism: B2B sales/marketing education and demand generation content

## Weak or Rejected Sources

- `@FoundationInc` was rejected because it did not match Ross Simmonds / Foundation Marketing in the RSS output.
- `@TheReeder` was rejected because the RSS feed contained old unrelated personal videos, not Devin Reed's B2B content.

## Next Step

Pick 5 to 8 videos from `youtube-latest-videos.csv`, then collect transcripts through Supadata, another transcript API, or manual YouTube transcript export.
