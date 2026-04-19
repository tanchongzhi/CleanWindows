<#
.SYNOPSIS
Clear Windows Media Player Cache.
#>

#
# CleanerMetadata # Begin
# Title: Windows Media Player Cache
# Name: Windows.MediaPlayer.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Media Player\cacheentry*.*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Media Player\Art Cache\LocalMLS\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Media Player\Transcoded Files Cache\*" -Recurse -Force
