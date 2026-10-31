<#
.SYNOPSIS
Clear Windows Wordpad History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Wordpad History
# Name: Windows.Wordpad.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List' -Recurse
