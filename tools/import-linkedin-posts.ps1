param(
    [string]$InputPath = "research/linkedin-posts/manual-posts.csv",
    [string]$OutputRoot = "research/linkedin-posts/collected"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $InputPath)) {
    throw "Input CSV not found: $InputPath"
}

function ConvertTo-Slug([string]$Value) {
    return ($Value.ToLowerInvariant() -replace '[^a-z0-9]+', '-' -replace '^-+|-+$', '').Substring(0, [Math]::Min(70, ($Value.ToLowerInvariant() -replace '[^a-z0-9]+', '-' -replace '^-+|-+$', '').Length))
}

$posts = Import-Csv $InputPath

foreach ($post in $posts) {
    $authorSlug = ConvertTo-Slug $post.Author
    $titleSlug = ConvertTo-Slug $post.Topic
    $authorDir = Join-Path $OutputRoot $authorSlug

    New-Item -ItemType Directory -Force -Path $authorDir | Out-Null

    $filePath = Join-Path $authorDir "$($post.Date)-$titleSlug.md"
    $content = @(
        "# LinkedIn Post Note",
        "",
        "- Author: $($post.Author)",
        "- Profile URL: $($post.ProfileUrl)",
        "- Post URL: $($post.PostUrl)",
        "- Date posted: $($post.Date)",
        "- Date collected: $((Get-Date).ToString('yyyy-MM-dd'))",
        "- Topic: $($post.Topic)",
        "",
        "## Post Text",
        "",
        $post.Text,
        "",
        "## Research Note",
        "",
        $post.Note,
        ""
    )

    Set-Content -Path $filePath -Value $content
}

Write-Host "Imported $($posts.Count) LinkedIn posts into $OutputRoot"
