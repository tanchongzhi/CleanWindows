<#
.SYNOPSIS
Clear Internet Explorer Download History.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer Download History
# Name: InternetExplorer.DownloadHistory
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\IEDownloadHistory\*" -Recurse -Force

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer' -Name 'Download Directory'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Main' -Name 'Save Directory'
