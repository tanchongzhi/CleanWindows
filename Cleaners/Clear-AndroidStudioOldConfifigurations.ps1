<#
.SYNOPSIS
Clear Android Studio Old Confifigurations.
#>

#
# CleanerMetadata # Begin
# Title: Android Studio Old Confifigurations
# Name: AndroidStudio.OldConfifigurations
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

$versions = @(
    Get-ChildItem -Path "$env:LOCALAPPDATA\Google" -Force | ForEach-Object {
        if ($_.Name -match '^AndroidStudio(\d+(?:\.\d+)*)$') {
            $version = $Matches[1]

            @{
                Item         = $_
                VersionParts = @($version.Split('.') | ForEach-Object { [int]$_ })
            }
        }
    }
)

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

[array]::Sort($versions, $comparer)

for ($i = 0; $i -lt ($versions.Count - 1); $i++) {
    Remove-Item -Path $versions[$i].Item.FullName -Recurse -Force
}
