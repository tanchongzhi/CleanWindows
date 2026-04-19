<#
.SYNOPSIS
Clear Graddle Cache.
#>

#
# CleanerMetadata # Begin
# Title: Graddle Cache
# Name: Graddle.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:USERPROFILE\.graddle\.tmp" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\.graddle\caches" -Recurse -Force
