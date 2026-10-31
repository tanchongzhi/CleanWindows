<#
.SYNOPSIS
Clear Node.js Pnpm Cache.
#>

#
# CleanerMetadata # Begin
# Title: Node.js Pnpm Cache
# Name: Pnpm.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\pnpm\store" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\pnpm-cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\pnpm-state" -Recurse -Force
