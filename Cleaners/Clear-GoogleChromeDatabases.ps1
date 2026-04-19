<#
.SYNOPSIS
Clear Google Chrome Databases.
#>

#
# CleanerMetadata # Begin
# Title: Google Chrome Databases
# Name: GoogleChrome.Databases
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\databases" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\IndexedDB" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\Session Storage" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\databases" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\IndexedDB" -Force
