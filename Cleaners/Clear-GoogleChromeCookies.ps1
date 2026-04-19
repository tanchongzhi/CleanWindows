<#
.SYNOPSIS
Clear Google Chrome Cookies.
#>

#
# CleanerMetadata # Begin
# Title: Google Chrome Cookies
# Name: GoogleChrome.Cookies
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\Cookies*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\Extension Cookies*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\Cookies*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\Extension Cookies*" -Force
