# Collection Method

Topic: YouTube content strategy for B2B SaaS

Date started: 2026-06-16

## Repository Workflow

This project will be built in small checkpoints:

1. Choose topic and create repository structure.
2. Add expert shortlist.
3. Collect public YouTube metadata for selected experts.
4. Collect transcripts where captions are available through a reliable API or public timedtext endpoint.
5. Manually collect LinkedIn posts when scraping is blocked or requires login.
6. Summarize patterns for a later playbook.

## YouTube Collection Plan

Preferred collection order:

1. Use official channel or handle URLs to verify the source.
2. Use public YouTube metadata where available.
3. Use a transcript API such as Supadata or another reliable transcript service.
4. If API access fails, log the failure and keep the video URL for later manual transcript collection.

## LinkedIn Collection Plan

LinkedIn posts will be collected manually or through an approved authenticated tool. The repository should not pretend to have scraped LinkedIn posts if the data was not actually collected.

For each expert, collect:

- 3 to 5 recent posts related to YouTube, video, content distribution, demand generation, or B2B SaaS marketing
- Original post URL
- Date collected
- Short note on why the post matters

## Quality Filter

Every source should answer at least one of these questions:

- What should a B2B SaaS company publish on YouTube?
- How should YouTube support demand generation?
- How should video content be distributed beyond YouTube?
- What metrics matter before pipeline or revenue attribution is obvious?
- How can subject-matter expertise be turned into repeatable video content?
