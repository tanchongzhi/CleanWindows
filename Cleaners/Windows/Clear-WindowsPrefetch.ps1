<#
.SYNOPSIS
Clear Windows Prefetch.
#>

#
# CleanerMetadata # Begin
# Title: Windows Prefetch
# Name: Windows.Prefetch
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:SystemRoot\Prefetch\*" -Recurse -Force
