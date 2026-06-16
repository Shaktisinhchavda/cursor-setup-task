param(
    [string]$TargetsPath = "research/youtube-transcripts/transcript-targets.md",
    [string]$OutputPath = "research/other/transcript-fetch-attempts.csv"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $TargetsPath)) {
    throw "Targets file not found: $TargetsPath"
}

$targetLines = Get-Content $TargetsPath | Where-Object { $_ -match 'https://www\.youtube\.com/(watch\?v=|shorts/)' }

$targets = foreach ($line in $targetLines) {
    $columns = $line -split '\|' | ForEach-Object { $_.Trim() }
    if ($columns.Count -lt 6) {
        continue
    }

    $urlMatch = [regex]::Match($line, 'https://www\.youtube\.com/(watch\?v=|shorts/)([A-Za-z0-9_-]{11})')
    if (-not $urlMatch.Success) {
        continue
    }

    [pscustomobject]@{
        Source = $columns[2]
        Video = $columns[3]
        VideoId = $urlMatch.Groups[2].Value
        Url = $urlMatch.Value
    }
}

$rows = foreach ($target in $targets) {
    try {
        $watchUrl = "https://www.youtube.com/watch?v=$($target.VideoId)"
        $html = (Invoke-WebRequest -Uri $watchUrl -UseBasicParsing).Content
        $captionMatches = [regex]::Matches($html, '"baseUrl":"([^"]+)"')

        if ($captionMatches.Count -eq 0) {
            [pscustomobject]@{
                Source = $target.Source
                Video = $target.Video
                VideoId = $target.VideoId
                Url = $target.Url
                CaptionTracksFound = 0
                FetchStatus = "No caption tracks found"
                ResponseLength = 0
                CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
            }
            continue
        }

        $baseUrl = $captionMatches[0].Groups[1].Value
        $baseUrl = $baseUrl -replace '\\u0026', '&'
        $baseUrl = $baseUrl -replace '\\/', '/'
        $baseUrl = [System.Text.RegularExpressions.Regex]::Unescape($baseUrl)

        if ($baseUrl.StartsWith("/")) {
            $baseUrl = "https://www.youtube.com$baseUrl"
        }

        $transcriptUrl = "$baseUrl&fmt=vtt"
        $response = Invoke-WebRequest -Uri $transcriptUrl -UseBasicParsing

        [pscustomobject]@{
            Source = $target.Source
            Video = $target.Video
            VideoId = $target.VideoId
            Url = $target.Url
            CaptionTracksFound = $captionMatches.Count
            FetchStatus = "HTTP $($response.StatusCode)"
            ResponseLength = $response.Content.Length
            CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
        }
    }
    catch {
        [pscustomobject]@{
            Source = $target.Source
            Video = $target.Video
            VideoId = $target.VideoId
            Url = $target.Url
            CaptionTracksFound = ""
            FetchStatus = $_.Exception.Message
            ResponseLength = 0
            CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
        }
    }
}

$directory = Split-Path -Parent $OutputPath
if ($directory -and -not (Test-Path $directory)) {
    New-Item -ItemType Directory -Force -Path $directory | Out-Null
}

$rows | Export-Csv -Path $OutputPath -NoTypeInformation
$rows
