<#
.SYNOPSIS
Clear Internet Explorer Temporary Files.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer Temporary Files
# Name: InternetExplorer.TemporaryFiles
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:USERPROFILE\AppData\LocalLow\Microsoft\Windows\AppCache\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\AppCache\*" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Feeds Cache\*" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\INetCache\*" -Recurse -Force
Remove-Item -Path "$env:SystemRoot\System32\config\systemprofile\AppData\Local\Microsoft\Windows\INetCache\*" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\WebCache\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\WebCache.old" -Recurse -Force

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\IECompatCache\*" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\IECompatUACache\*" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Microsoft\Windows\IETldCache\*" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Internet Explorer\MSIMGSIZ.DAT" -Force
