<#
.SYNOPSIS
Clear Adobe Product Cache.
#>

#
# CleanerMetadata # Begin
# Title: Adobe Product Cache
# Name: Adobe.ProductCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Adobe\Acrobat\10.0\Cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Adobe\Acrobat\11.0\Cache" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Adobe\Acrobat\DC\Cache" -Recurse -Force

Remove-Item -Path "$env:USERPROFILE\AppData\LocalLow\Adobe\Acrobat\10.0\Search" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\LocalLow\Adobe\Acrobat\11.0\Search" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\LocalLow\Adobe\Acrobat\DC\Search" -Recurse -Force

Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\DC\AVConnector\cIconCache' -Recurse
