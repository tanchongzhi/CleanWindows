<#
.SYNOPSIS
Clear Go Module Cache.
#>

#
# CleanerMetadata # Begin
# Title: Go Module Cache
# Name: Go.ModuleCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:USERPROFILE\go\pkg\mod" -Recurse -Force
