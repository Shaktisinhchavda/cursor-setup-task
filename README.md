# YouTube Content Strategy for B2B SaaS

This repository is a research project on **YouTube content strategy for B2B SaaS**.

The goal is to study practitioners and companies that use video, content distribution, demand generation, SaaS education, and founder-led authority to influence B2B buyers.

## Why This Topic

B2B SaaS buyers increasingly research products, categories, and operators before speaking with sales. YouTube can support that research process through tutorials, product education, founder-led points of view, expert interviews, and repurposable long-form content.

## What Was Collected

- 10 expert/source shortlist in `research/sources.md`
- public YouTube channel metadata in `research/other/youtube-handle-check.csv`
- recent public YouTube RSS uploads in `research/other/youtube-latest-videos.csv`
- transcript target list in `research/youtube-transcripts/transcript-targets.md`
- 9 collected YouTube transcripts in `research/youtube-transcripts/collected/`
- transcript API result log in `research/other/youtube-transcript-api-results.csv`
- transcript fetch attempt log in `research/other/transcript-fetch-attempts.csv`
- public source notes from Foundation and Vidyard in `research/other/`
- LinkedIn manual collection targets in `research/linkedin-posts/`
- SaaS YouTube channel examples in `research/company-examples/`
- synthesis and playbook drafts in `research/synthesis/`
- collection scripts in `tools/`

## Repository Structure

- `research/sources.md` - 10 experts with links, notes, and selection rationale
- `research/youtube-transcripts/` - transcript targets and per-video transcript collection notes
- `research/linkedin-posts/` - LinkedIn collection targets organized by author
- `research/other/` - API outputs, collection logs, source notes, and templates
- `research/company-examples/` - mini case notes on SaaS/B2B YouTube channels
- `research/synthesis/` - patterns, playbook drafts, measurement framework, and research gaps
- `tools/` - PowerShell scripts used for YouTube metadata and transcript collection attempts

## Why These Experts Were Chosen

The expert list intentionally mixes:

- B2B content distribution experts
- demand generation operators
- SaaS education creators
- B2B video marketing practitioners
- founder-led SaaS YouTube creators
- company channels using YouTube for product education and demand creation

The goal was not to collect generic YouTube growth advice. The goal was to find sources strong enough to support a real B2B SaaS playbook later.

## Collection Methods

YouTube collection used:

- public YouTube channel pages
- public YouTube RSS feeds
- YouTube watch-page caption metadata checks
- `youtube-transcript` npm package for transcript collection
- transcript endpoint attempts logged in `research/other/transcript-fetch-attempts.csv`

LinkedIn collection status:

- LinkedIn targets are organized by author.
- Public LinkedIn profile/activity access was checked and logged in `research/other/linkedin-public-access-check.csv`.
- Activity pages returned LinkedIn `999`/authwall responses, so post text still needs authenticated or manual collection.

## Current Limitations

- 9 of 10 YouTube transcript targets were successfully collected through the transcript API. One Shorts target failed.
- LinkedIn post text still requires manual or authenticated collection because public activity pages are blocked.
- The playbook in `research/synthesis/draft-playbook.md` is a draft based on metadata, public source notes, and company examples.

## Strongest Outputs

- `research/sources.md`
- `research/other/youtube-handle-check.csv`
- `research/other/youtube-latest-videos.csv`
- `research/youtube-transcripts/collected/`
- `research/company-examples/`
- `research/synthesis/draft-playbook.md`
- `research/synthesis/content-pillar-matrix.md`
- `research/synthesis/first-90-days-calendar.md`
- `research/synthesis/measurement-framework.md`
