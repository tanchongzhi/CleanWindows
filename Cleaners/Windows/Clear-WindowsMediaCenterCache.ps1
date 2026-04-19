<#
.SYNOPSIS
Clear Windows Media Center Cache.
#>

#
# CleanerMetadata # Begin
# Title: Windows Media Center Cache
# Name: Windows.MediaCenter.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\eHome\*" -Recurse -Force
Remove-Item -Path "$env:PUBLIC\Recorded TV\TempRec\TempSBE\*" -Recurse -Force
