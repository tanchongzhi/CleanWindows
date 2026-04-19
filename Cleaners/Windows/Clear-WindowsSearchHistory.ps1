<#
.SYNOPSIS
Clear Windows Search History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Search History
# Name: Windows.Search.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery' -Recurse
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\ConnectedSearch\History\*" -Recurse -Force
