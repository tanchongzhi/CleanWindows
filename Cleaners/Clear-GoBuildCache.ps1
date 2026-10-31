<#
.SYNOPSIS
Clear Go Build Cache.
#>

#
# CleanerMetadata # Begin
# Title: Go Build Cache
# Name: Go.BuildCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\go-build" -Recurse -Force
