<#
.SYNOPSIS
Clear Windows Jump Lists.
#>

#
# CleanerMetadata # Begin
# Title: Windows Jump Lists
# Name: Windows.JumpLists
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\AutomaticDestinations\*.automaticDestinations-ms" -Force
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\CustomDestinations\*.customDestinations-ms" -Force
