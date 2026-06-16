# Assignment Compliance Map

This file maps the repository to the requirements in `next_stage.md`.

## Chosen Topic

Topic selected: **YouTube content strategy for B2B SaaS**

Evidence:

- `README.md`
- `research/sources.md`

## 10 Experts

Evidence:

- `research/sources.md`

The shortlist includes practitioners and teams across B2B SaaS content, demand generation, video strategy, founder-led content, and SaaS education.

## Recent Content Collection

Evidence:

- `research/other/youtube-handle-check.csv`
- `research/other/youtube-latest-videos.csv`
- `research/youtube-transcripts/transcript-targets.md`
- `research/youtube-transcripts/collected/`
- `research/youtube-transcripts/video-notes/`
- `research/other/youtube-transcript-api-results.csv`
- `research/other/transcript-fetch-attempts.csv`
- `research/linkedin-posts/linkedin-collection-targets.md`
- `research/other/linkedin-public-access-check.csv`

Notes:

- YouTube channel and latest-video metadata was collected through public YouTube pages and RSS feeds.
- Transcript collection was completed for 9 of 10 selected videos through the `youtube-transcript` npm package.
- LinkedIn public profile/activity access was tested and logged. Activity pages returned `999`/authwall responses, so post text still requires authenticated or manual collection.

## Required Folder Structure

Evidence:

- `research/sources.md`
- `research/linkedin-posts/`
- `research/youtube-transcripts/`
- `research/other/`

Additional useful folders:

- `research/company-examples/`
- `research/synthesis/`
- `tools/`

## README Update

Evidence:

- `README.md`

The README explains:

- what was collected
- why the experts were chosen
- collection methods
- repository structure
- current limitations

## API / Tooling Work

Evidence:

- `tools/collect-youtube-metadata.ps1`
- `tools/test-youtube-transcripts.ps1`
- `tools/collect-youtube-transcripts.js`
- `tools/check-linkedin-public-access.ps1`
- `tools/import-linkedin-posts.ps1`
- `research/other/youtube-handle-check.csv`
- `research/other/youtube-latest-videos.csv`
- `research/other/youtube-transcript-api-results.csv`
- `research/other/transcript-fetch-attempts.csv`
- `research/other/linkedin-public-access-check.csv`

## Playbook Readiness

Evidence:

- `research/synthesis/draft-playbook.md`
- `research/synthesis/content-pillar-matrix.md`
- `research/synthesis/first-90-days-calendar.md`
- `research/synthesis/measurement-framework.md`
- `research/company-examples/`

The collected material is strong enough to support a draft playbook. The main remaining evidence gap is LinkedIn post text, which requires authenticated or manual collection.
