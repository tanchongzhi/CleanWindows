<#
.SYNOPSIS
Clear Internet Explorer Cookies.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer Cookies
# Name: InternetExplorer.Cookies
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\Cookies\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\INetCookies\*" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Internet Explorer\DOMStore\*" -Recurse -Force
Remove-Item -Path '$env:USERPROFILE\AppData\LocalLow\Microsoft\Internet Explorer\DOMStore\*' -Recurse -Force

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\DOMStorage' -Recurse
