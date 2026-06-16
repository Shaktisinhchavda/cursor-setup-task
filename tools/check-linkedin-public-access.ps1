param(
    [string]$TargetsPath = "research/linkedin-posts/linkedin-collection-targets.md",
    [string]$OutputPath = "research/other/linkedin-public-access-check.csv"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $TargetsPath)) {
    throw "Targets file not found: $TargetsPath"
}

$targets = Get-Content $TargetsPath | Where-Object {
    $_ -match 'https://www\.linkedin\.com/in/'
} | ForEach-Object {
    $columns = $_ -split '\|' | ForEach-Object { $_.Trim() }
    $urlMatch = [regex]::Match($_, 'https://www\.linkedin\.com/in/[^/\s]+/?')

    if ($columns.Count -ge 4 -and $urlMatch.Success) {
        [pscustomobject]@{
            Expert = $columns[2]
            ProfileUrl = $urlMatch.Value.TrimEnd("/")
            ActivityUrl = "$($urlMatch.Value.TrimEnd('/'))/recent-activity/all/"
        }
    }
}

$rows = foreach ($target in $targets) {
    foreach ($urlType in @("ProfileUrl", "ActivityUrl")) {
        $url = $target.$urlType

        try {
            $response = Invoke-WebRequest -Uri $url -UseBasicParsing -MaximumRedirection 5
            $title = [regex]::Match($response.Content, '<title>(.*?)</title>').Groups[1].Value
            $hasAuthwall = $response.Content -match '/authwall|sessionRedirect|login'

            [pscustomobject]@{
                Expert = $target.Expert
                UrlType = $urlType
                Url = $url
                Status = $response.StatusCode
                ResponseLength = $response.Content.Length
                Title = [System.Net.WebUtility]::HtmlDecode($title)
                AuthwallDetected = $hasAuthwall
                CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
            }
        }
        catch {
            [pscustomobject]@{
                Expert = $target.Expert
                UrlType = $urlType
                Url = $url
                Status = if ($_.Exception.Response) { $_.Exception.Response.StatusCode.value__ } else { "ERROR" }
                ResponseLength = 0
                Title = $_.Exception.Message
                AuthwallDetected = $true
                CollectedAt = (Get-Date).ToString("yyyy-MM-dd")
            }
        }
    }
}

$directory = Split-Path -Parent $OutputPath
if ($directory -and -not (Test-Path $directory)) {
    New-Item -ItemType Directory -Force -Path $directory | Out-Null
}

$rows | Export-Csv -Path $OutputPath -NoTypeInformation
$rows
