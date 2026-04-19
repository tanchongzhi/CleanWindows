<#
.SYNOPSIS
Clear Windows Temporary Files.
#>

#
# CleanerMetadata # Begin
# Title: Windows Temporary Files
# Name: Windows.TemporaryFiles
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:SystemRoot\*.tmp" -Force
Remove-Item -Path "$env:SystemRoot\*.old" -Force
Remove-Item -Path "$env:SystemRoot\Temp\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Recurse -Force
Remove-Item -Path "$env:USERPROFILE\AppData\LocalLow\Temp\*" -Recurse -Force
