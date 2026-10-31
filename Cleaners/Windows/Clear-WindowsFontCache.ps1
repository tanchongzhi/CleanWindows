<#
.SYNOPSIS
Clear Windows Font Cache.
#>

#
# CleanerMetadata # Begin
# Title: Windows Font Cache
# Name: Windows.FontCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Stop-Service -Name 'FontCache' -Force
Remove-Item -Path "$env:SystemRoot\ServiceProfiles\LocalService\AppData\Local\*FontCache*.dat" -Force
Remove-Item -Path "$env:SystemRoot\System32\FNTCACHE.DAT" -Force
Start-Service -Name 'FontCache'

#
$service = Get-Service -Name 'FontCache3.0.0.0'
$serviceStatus = $service.Status

if ($null -ne $service) {
    Stop-Service -Name 'FontCache3.0.0.0' -Force

    Remove-Item -Path "$env:LOCALAPPDATA\GDIPFONTCACHEV1.DAT" -Force

    if ($serviceStatus -ieq 'Running') {
        Start-Service -Name 'FontCache3.0.0.0'
    }
}
