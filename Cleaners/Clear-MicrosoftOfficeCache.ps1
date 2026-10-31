<#
.SYNOPSIS
Clear Microsoft Office Cache.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Office Cache
# Name: MicrosoftOffice.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Microsoft\Office\Recent\*" -Recurse -Force
Remove-Item -Path "$env:APPDATA\Microsoft\PowerPoint\Sync\Temp\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\MSOIdentityCRL\production\temp\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Office\16.0\WebServiceCache\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Office\16.0\OfficeFileCache\*" -Recurse -Force
