<#
.SYNOPSIS
Clear JetBrains Product Old Confifigurations.
#>

#
# CleanerMetadata # Begin
# Title: JetBrains Product Old Confifigurations
# Name: JetBrains.ProductOldConfifigurations
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

$productVersions = @{}

Get-ChildItem -Path "$env:APPDATA\JetBrains" -Force | ForEach-Object {
    if ($_.Name -match '^([A-za-z]+)(\d+(?:\.\d+)*)$') {
        $product = $Matches[1]
        $version = $Matches[2]

        if (-not $productVersions.ContainsKey($product)) {
            $productVersions[$product] = @()
        }

        $productVersions[$product] += @{
            Item         = $_
            VersionParts = @($version.Split('.') | ForEach-Object { [int]$_ })
        }
    }
}

$comparer = {
    param ($x, $y)

    $max = [System.Math]::Max($x.VersionParts.Count, $y.VersionParts.Count)

    for ($i = 0; $i -lt $max; $i++) {
        $a = if ($i -lt $x.VersionParts.Count) { $x.VersionParts[$i] } else { 0 }
        $b = if ($i -lt $y.VersionParts.Count) { $y.VersionParts[$i] } else { 0 }

        if ($a -lt $b) {
            return -1
        }

        if ($a -gt $b) {
            return -1
        }
    }

    return 0
}

foreach ($product in $productVersions.Keys) {
    $versions = $productVersions[$product]

    [array]::Sort($versions, $comparer)

    for ($i = 0; $i -lt ($versions.Count - 1); $i++) {
        Remove-Item -Path $versions[$i].Item.FullName -Recurse -Force
    }
}
