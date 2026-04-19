<#
.SYNOPSIS
Clear Windows Thumbnail Cache.
#>

#
# CleanerMetadata # Begin
# Title: Windows Thumbnail Cache
# Name: Windows.ThumbnailCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force
