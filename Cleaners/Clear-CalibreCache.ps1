<#
.SYNOPSIS
Clear Calibre Cache.
#>

#
# CleanerMetadata # Begin
# Title: Calibre Cache
# Name: Calibre.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\calibre-cache" -Recurse -Force

Remove-Item -Path "$env:APPDATA\calibre\caches" -Recurse -Force
Remove-Item -Path "$env:APPDATA\calibre\fonts\scanner_cache.json" -Force
