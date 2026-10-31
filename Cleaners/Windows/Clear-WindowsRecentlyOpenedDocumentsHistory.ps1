<#
.SYNOPSIS
Clear Windows Recently Opened Documents History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Recently Opened Documents History
# Name: Windows.RecentlyOpenedDocumentsHistory
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Recent\*.lnk" -Force

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs' -Recurse
