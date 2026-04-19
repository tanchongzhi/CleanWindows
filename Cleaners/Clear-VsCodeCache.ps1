<#
.SYNOPSIS
Clear VS Code Cache.
#>

#
# CleanerMetadata # Begin
# Title: VSCode Cache
# Name: VSCode.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Code\CachedConfigurations" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\CachedData" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\CachedExtensionVSIXs" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\CachedProfilesData" -Recurse -Force

Remove-Item -Path "$env:APPDATA\Code\Cache" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\Code Cache" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\Crashpad" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\DawnGraphiteCache" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\DawnWebGPUCache" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\GPUCache" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Code\Service Worker\ScriptCache" -Recurse -Force
