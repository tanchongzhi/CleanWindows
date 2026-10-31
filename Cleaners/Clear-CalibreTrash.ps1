<#
.SYNOPSIS
Clear Calibre Trash.
#>

#
# CleanerMetadata # Begin
# Title: Calibre Trash
# Name: Calibre.Trash
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

if (Test-Path -Path "$env:APPDATA\calibre\global.py.json") {
    $matched = Select-String -Path "$env:APPDATA\calibre\global.py.json" -Pattern '"library_path":\s*"([^"]+)"'

    if ($matched) {
        $libraryPath = $matched.Matches[0].Groups[1].Value.Replace('\\', '\')
        $trashPath = Join-Path -Path $libraryPath -ChildPath '.caltrash'

        Remove-Item -Path $trashPath -Recurse -Force
    }
}
