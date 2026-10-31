<#
.SYNOPSIS
Clear Internet Download Manager History.
#>

#
# CleanerMetadata # Begin
# Title: Internet Download Manager History
# Name: InternetDownloadManager.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\IDM\UrlHistory.txt" -Force
Remove-Item -Path "$env:APPDATA\IDM\foldresHistory.txt" -Force
Remove-Item -Path "$env:APPDATA\IDM\DwnlData" -Recurse -Force
