<#
.SYNOPSIS
Clear Windows Run History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Run History
# Name: Windows.RunHistory
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Recurse
