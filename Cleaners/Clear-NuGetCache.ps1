<#
.SYNOPSIS
Clear NuGet Cache.
#>

#
# CleanerMetadata # Begin
# Title: NuGet Cache
# Name: NuGet.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\NuGet\v3-cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\NuGet\plugins-cache" -Recurse -Force
