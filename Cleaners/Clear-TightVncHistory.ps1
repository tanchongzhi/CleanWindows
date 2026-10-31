<#
.SYNOPSIS
Clear TightVNC History.
#>

#
# CleanerMetadata # Begin
# Title: TightVNC History
# Name: TightVNC.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\TightVNC\Viewer\History' -Recurse
