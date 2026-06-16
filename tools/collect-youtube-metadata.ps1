param(
    [string]$OutputPath = "research/other/youtube-handle-check.csv",
    [string]$LatestVideosPath = "research/other/youtube-latest-videos.csv"
)

$ErrorActionPreference = "Stop"

$channels = @(
    @{ Expert = "Dave Gerhardt / Exit Five"; Handle = "ExitFive" },
    @{ Expert = "Ali Schwanke / HubSpot Hacks"; Handle = "HubSpotHacks" },
    @{ Expert = "Tyler Lessard / Vidyard"; Handle = "Vidyard" },
    @{ Expert = "Sam Dunning"; Handle = "SamDunning" },
    @{ Expert = "Wistia / Chris Savage"; Handle = "wistia" },
    @{ Expert = "TK Kader"; Handle = "TKKader" },
    @{ Expert = "Directive Consulting"; Handle = "DirectiveConsulting" },
    @{ Expert = "Cognism"; Handle = "Cognism" },
    @{ Expert = "Metadata.io"; Handle = "Metadataio" },
    @{ Expert = "Lavender"; Handle = "LavenderHQ" }
)

$rows = foreach ($channel in $channels) {
    $url = "https://www.youtube.com/@$($channel.Handle)"

    try {
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing -MaximumRedirection 5
        $html = $response.Content
        $channelIdMatch = [regex]::Match($html, '\\x22externalId\\x22:\\x22(UC[A-Za-z0-9_-]+)\\x22')
        if (-not $channelIdMatch.Success) {
            $channelIdMatch = [regex]::Match($html, '\\x22browseId\\x22:\\x22(UC[A-Za-z0-9_-]+)\\x22')
        }

        [pscustomobject]@{
            Expert = $channel.Expert
            Handle = $channel.Handle
            Url = $url
            Status = $response.StatusCode
            ChannelId = $channelIdMatch.Groups[1].Value
            CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
            Notes = "Public YouTube handle reachable"
        }
    }
    catch {
        [pscustomobject]@{
            Expert = $channel.Expert
            Handle = $channel.Handle
            Url = $url
            Status = "ERROR"
            ChannelId = ""
            CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
            Notes = $_.Exception.Message
        }
    }
}

$directory = Split-Path -Parent $OutputPath
if ($directory -and -not (Test-Path $directory)) {
    New-Item -ItemType Directory -Force -Path $directory | Out-Null
}

$rows | Export-Csv -Path $OutputPath -NoTypeInformation

$latestRows = foreach ($row in $rows) {
    if (-not $row.ChannelId) {
        continue
    }

    $feedUrl = "https://www.youtube.com/feeds/videos.xml?channel_id=$($row.ChannelId)"

    try {
        [xml]$feed = (Invoke-WebRequest -Uri $feedUrl -UseBasicParsing).Content
        $entries = @($feed.feed.entry | Select-Object -First 3)

        foreach ($entry in $entries) {
            [pscustomobject]@{
                Expert = $row.Expert
                Handle = $row.Handle
                ChannelId = $row.ChannelId
                VideoTitle = $entry.title
                VideoUrl = $entry.link.href
                Published = $entry.published
                CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
            }
        }
    }
    catch {
        [pscustomobject]@{
            Expert = $row.Expert
            Handle = $row.Handle
            ChannelId = $row.ChannelId
            VideoTitle = "ERROR"
            VideoUrl = $feedUrl
            Published = ""
            CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
        }
    }
}

$latestRows | Export-Csv -Path $LatestVideosPath -NoTypeInformation
$rows
