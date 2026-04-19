<#
.SYNOPSIS
Clear Internet Explorer History.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer History
# Name: InternetExplorer.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\History\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Internet Explorer\Recovery\*" -Recurse -Force

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\PrivacIE\*" -Recurse -Force

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\TypedURLs' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\TypedURLsTime' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Explorer Bars\{C4EE31F3-4768-11D2-BE5C-00A0C9A83DA1}\ContainingTextMRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Explorer Bars\{C4EE31F3-4768-11D2-BE5C-00A0C9A83DA1}\FilesNamedMRU' -Recurse

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Ext\Stats' -Recurse
