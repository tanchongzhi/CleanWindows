<#
.SYNOPSIS
Clear Microsoft Edge Cookies.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Edge Cookies
# Name: MicrosoftEdge.Cookies
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Cookies*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Extension Cookies*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Cookies*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Extension Cookies*" -Force
