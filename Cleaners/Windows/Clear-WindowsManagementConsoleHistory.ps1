<#
.SYNOPSIS
Clear Windows Management Console History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Management Console History
# Name: Windows.ManagementConsole.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Microsoft Management Console\Recent File List' -Recurse
