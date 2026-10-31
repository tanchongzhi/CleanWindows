<#
.SYNOPSIS
Clear Microsoft Edge Cache.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Edge Cache
# Name: MicrosoftEdge.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\blob_storage" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Code Cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Download Service" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\DawnGraphiteCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\DawnWebGPUCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Extensions Rules" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Extensions Scripts" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Extensions State" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Extensions\Temp" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\GCM Store" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\GPUCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Service Worker\CacheStorage" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Service Worker\Database" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Service Worker\ScriptCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Site Characteristics Database" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Storage\ext\*\def\GPUCache" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Network Action Predictor*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Network Persistent State" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\heavy_ad_intervention_opt_out.db*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\blob_storage" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Code Cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Download Service" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\DawnGraphiteCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\DawnWebGPUCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Extensions Rules" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Extensions Scripts" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Extensions State" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Extensions\Temp" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\GCM Store" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\GPUCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Service Worker\CacheStorage" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Service Worker\Database" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Service Worker\ScriptCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Site Characteristics Database" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Storage\ext\*\def\GPUCache" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Network Action Predictor*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Network Persistent State" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\heavy_ad_intervention_opt_out.db*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\*.pma" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\BrowserMetrics" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Crashpad" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\CrashpadMetrics.pma*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\GPUPersistentCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\GraphiteDawnCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\GrShaderCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\ShaderCache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Webstore Downloads" -Recurse -Force
