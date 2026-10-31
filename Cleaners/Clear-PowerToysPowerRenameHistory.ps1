<#
.SYNOPSIS
Clear PowerToys PowerRename History.
#>

#
# CleanerMetadata # Begin
# Title: PowerToys PowerRename History
# Name: PowerToys.PowerRename.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\PowerRename\power-rename-last-run-data.json" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\PowerRename\replace-mru.json" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\PowerRename\search-mru.json" -Force
