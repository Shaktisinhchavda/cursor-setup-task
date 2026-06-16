# Final Report: YouTube Content Strategy for B2B SaaS

Date: 2026-06-16

## Topic

YouTube content strategy for B2B SaaS.

## Research Objective

The objective was to collect and organize high-signal source material from practitioners and companies that can inform a practical YouTube content strategy for B2B SaaS.

## Expert Selection

The shortlist in `research/sources.md` includes 10 experts or teams. They were selected because they represent complementary parts of the problem:

- content distribution
- demand generation
- SaaS education
- video marketing
- founder-led growth
- content repurposing
- B2B sales and revenue workflows

This avoids relying only on generic YouTube growth creators.

## Collection Summary

Collected:

- 10 expert shortlist with annotations
- verified YouTube handle metadata
- recent YouTube RSS upload metadata
- transcript target list
- 9 collected YouTube transcripts
- transcript API result log
- transcript collection attempt log
- per-video transcript collection notes
- LinkedIn collection targets by expert
- LinkedIn public access check log
- public article source notes
- SaaS/B2B channel examples
- draft playbook and synthesis files

## Tools Used

Custom PowerShell scripts:

- `tools/collect-youtube-metadata.ps1`
- `tools/test-youtube-transcripts.ps1`
- `tools/check-linkedin-public-access.ps1`
- `tools/import-linkedin-posts.ps1`

Node transcript collector:

- `tools/collect-youtube-transcripts.js`

Outputs:

- `research/other/youtube-handle-check.csv`
- `research/other/youtube-latest-videos.csv`
- `research/other/youtube-transcript-api-results.csv`
- `research/other/transcript-fetch-attempts.csv`
- `research/other/linkedin-public-access-check.csv`

## Key Findings

### 1. B2B SaaS YouTube Should Start With Buyer Problems

The strongest examples are not generic brand videos. They are tutorials, product-led education, founder/operator points of view, and expert-led conversations that answer real buyer questions.

### 2. Distribution Matters As Much As Production

The Foundation source note supports treating each video as a source asset for LinkedIn, email, sales enablement, website embeds, and short clips.

### 3. YouTube Can Serve Multiple GTM Jobs

The research supports at least four jobs:

- active demand capture through tutorials
- demand creation through category POV
- product evaluation through workflow videos
- content leverage through repurposable interviews

### 4. Views Are Not The Only Metric

For B2B SaaS, qualified attention matters more than broad reach. Useful metrics include retention, product-page clicks, sales usage, qualified comments, newsletter signups, and influenced conversations.

## Strongest Research Artifacts

- `research/sources.md`
- `research/youtube-transcripts/collected/`
- `research/company-examples/`
- `research/synthesis/draft-playbook.md`
- `research/synthesis/content-pillar-matrix.md`
- `research/synthesis/first-90-days-calendar.md`
- `research/synthesis/measurement-framework.md`
- `research/assignment-compliance.md`

## Limitations

9 of 10 selected YouTube transcripts were collected successfully through the `youtube-transcript` npm package. One Shorts target failed.

LinkedIn post text was not scraped because unauthenticated LinkedIn scraping is unreliable. The project includes organized author targets for manual or authenticated collection.

## Playbook Readiness

The material collected is strong enough to support a draft playbook. The next improvement would be adding authenticated or manually collected LinkedIn post text to strengthen the social-content evidence.
