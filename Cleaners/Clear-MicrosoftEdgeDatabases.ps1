<#
.SYNOPSIS
Clear Microsoft Edge Databases.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Edge Databases
# Name: MicrosoftEdge.Databases
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\databases" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\IndexedDB" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Session Storage" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\databases" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\IndexedDB" -Force
