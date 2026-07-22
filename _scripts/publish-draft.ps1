<#
.SYNOPSIS
    Move a draft from _drafts/ into _posts/ with a date prefix and update its frontmatter.

.PARAMETER Slug
    The filename slug (without .md) of the draft. E.g. "building-a-behaviour-tree-in-unity"

.PARAMETER Date
    Publish date in yyyy-MM-dd format. Defaults to today.

.EXAMPLE
    pwsh _scripts/publish-draft.ps1 -Slug "building-a-behaviour-tree-in-unity"
    pwsh _scripts/publish-draft.ps1 -Slug "my-ai-experiment" -Date "2026-06-01"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$Slug,
    [string]$Date = ""
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

if ($Date -eq "") {
    $publishDate = Get-Date
} else {
    $publishDate = [datetime]::ParseExact($Date, "yyyy-MM-dd", $null)
}

$dateStr      = $publishDate.ToString("yyyy-MM-dd")
$dateTimeFull = $publishDate.ToString("yyyy-MM-dd HH:mm:ss") + " +0530"
$year         = $publishDate.Year

$srcFile  = Join-Path $repoRoot "_drafts\$Slug.md"
$destFile = Join-Path $repoRoot "_posts\$dateStr-$Slug.md"

if (-not (Test-Path $srcFile)) {
    Write-Error "Draft not found: _drafts/$Slug.md"
}

if (Test-Path $destFile) {
    Write-Error "Post already exists: _posts/$dateStr-$Slug.md"
}

$content = Get-Content $srcFile -Raw

# Update or insert the date field in frontmatter
if ($content -match "(?m)^date:.*$") {
    $content = $content -replace "(?m)^date:.*$", "date: $dateTimeFull"
} else {
    # Insert after layout line if date field is missing
    $content = $content -replace "(?m)^(layout:.*)`n", "`$1`ndate: $dateTimeFull`n"
}

$postsDir = Join-Path $repoRoot "_posts"
if (-not (Test-Path $postsDir)) {
    New-Item -ItemType Directory -Path $postsDir | Out-Null
}

Set-Content -Path $destFile -Value $content -Encoding UTF8
Remove-Item $srcFile

Write-Host ""
Write-Host "Published: _posts/$dateStr-$Slug.md"
Write-Host "  URL: /blog/$year/$Slug/"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  git add _posts/$dateStr-$Slug.md"
Write-Host "  git commit -m `"blog: $Slug`""
Write-Host "  git push"
Write-Host ""
