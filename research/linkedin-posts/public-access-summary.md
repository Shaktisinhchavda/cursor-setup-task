# LinkedIn Public Access Summary

Date checked: 2026-06-16

Script:

```text
tools/check-linkedin-public-access.ps1
```

Output:

```text
research/other/linkedin-public-access-check.csv
```

## Result

Public profile pages were partly reachable for several experts, but LinkedIn activity pages returned `999` responses or authwall markers. That means post text could not be reliably collected through unauthenticated command-line scraping.

## What Was Still Collected

The checker logged:

- profile URL
- activity URL
- HTTP status
- response length
- page title when visible
- authwall detection
- collection date

## Next Practical Collection Method

Use `research/linkedin-posts/manual-posts-template.csv` to paste manually collected LinkedIn post text, then run:

```powershell
./tools/import-linkedin-posts.ps1
```

This converts manually collected posts into organized Markdown notes under:

```text
research/linkedin-posts/collected/
```
