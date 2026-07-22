<#
.SYNOPSIS
    Scaffold a new blog post from the draft template.

.PARAMETER Title
    The post title. Will be slugified for the filename.

.PARAMETER Tags
    Space-separated tags. E.g. "ai python game-dev"

.PARAMETER Category
    The post category. Defaults to "tutorials".

.PARAMETER Draft
    When set, writes to _drafts/ (no date prefix). This is the default.
    Use -NoDraft to write directly to _posts/ with today's date.

.EXAMPLE
    pwsh _scripts/new-post.ps1 -Title "Building a behaviour tree in Unity" -Tags "unity game-dev ai" -Category "tutorials"
    pwsh _scripts/new-post.ps1 -Title "My AI experiment" -Tags "ai python" -NoDraft
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Title,
    [string]$Tags = "",
    [string]$Category = "tutorials",
    [switch]$NoDraft
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

function Slugify([string]$text) {
    $text = $text.ToLower()
    $text = $text -replace "[^a-z0-9\s-]", ""
    $text = $text -replace "\s+", "-"
    $text = $text -replace "-{2,}", "-"
    $text = $text.Trim("-")
    return $text
}

$slug = Slugify $Title
$now  = Get-Date
$dateStr  = $now.ToString("yyyy-MM-dd")
$dateTime = $now.ToString("yyyy-MM-dd HH:mm:ss") + " +0530"

$templatePath = Join-Path $repoRoot "_drafts\_template.md"
if (-not (Test-Path $templatePath)) {
    Write-Error "Template not found at $templatePath"
}
$template = Get-Content $templatePath -Raw

$content = $template `
    -replace "Post Title Here", $Title `
    -replace "YYYY-MM-DD HH:MM:SS \+0530", $dateTime `
    -replace "One-line summary of the post \(~140 chars\)", "TODO: add a one-line description" `
    -replace "tag1 tag2", ($Tags -replace ",", " ") `
    -replace "categories: tutorials", "categories: $Category" `
    -replace "assets/img/blog/post-slug/cover\.jpg", "assets/img/blog/$slug/cover.jpg" `
    -replace "assets/img/blog/post-slug/screenshot\.png", "assets/img/blog/$slug/screenshot.png" `
    -replace "assets/img/blog/post-slug", "assets/img/blog/$slug"

$imgDir = Join-Path $repoRoot "assets\img\blog\$slug"
if (-not (Test-Path $imgDir)) {
    New-Item -ItemType Directory -Path $imgDir | Out-Null
    Write-Host "  Created image folder: assets/img/blog/$slug/"
}

if ($NoDraft) {
    $outDir  = Join-Path $repoRoot "_posts"
    $outFile = Join-Path $outDir "$dateStr-$slug.md"
    $dest    = "_posts/$dateStr-$slug.md"
} else {
    $outDir  = Join-Path $repoRoot "_drafts"
    $outFile = Join-Path $outDir "$slug.md"
    $dest    = "_drafts/$slug.md"
}

if (Test-Path $outFile) {
    Write-Error "File already exists: $dest"
}

Set-Content -Path $outFile -Value $content -Encoding UTF8

Write-Host ""
Write-Host "Post created: $dest"
if (-not $NoDraft) {
    Write-Host "  This is a draft. Run 'docker compose up' to preview, then publish with:"
    Write-Host "  pwsh _scripts/publish-draft.ps1 -Slug '$slug'"
} else {
    Write-Host "  Published at: /blog/$($now.Year)/$slug/"
}
Write-Host ""
