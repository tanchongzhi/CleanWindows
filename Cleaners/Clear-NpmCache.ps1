<#
.SYNOPSIS
Clear Node.js Npm Cache.
#>

#
# CleanerMetadata # Begin
# Title: Node.js Npm Cache
# Name: Npm.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\npm-cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\npm-cache" -Recurse -Force
