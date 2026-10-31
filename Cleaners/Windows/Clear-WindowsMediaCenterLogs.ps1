<#
.SYNOPSIS
Clear Windows Media Center Logs.
#>

#
# CleanerMetadata # Begin
# Title: Windows Media Center Logs
# Name: Windows.MediaCenter.Logs
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:ProgramData\Microsoft\eHome\logs\*" -Recurse -Force
