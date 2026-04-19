<#
.SYNOPSIS
Clear Windows Logs.
#>

#
# CleanerMetadata # Begin
# Title: Windows Logs
# Name: Windows.Logs
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

# Event Logs
try {
    Get-EventLog -LogName * | ForEach-Object { Clear-EventLog -LogName $_.Log }
} catch {
    #
}

# Windows Event Tracing Logs
Get-ChildItem -Path "$env:SystemRoot\System32\LogFiles" -Include @('*.etl', '*.etl.*', '*.log', '*.xml') -Recurse -Force | Remove-Item -Force

# WMI Logs
Remove-Item -Path "$env:SystemRoot\System32\wbem\Logs" -Include @('*.log', '*.lo_') -Force
Remove-Item -Path "$env:SystemRoot\SysWOW64\wbem\Logs" -Include @('*.log', '*.lo_') -Force

#
Remove-Item -Path "$env:SystemRoot\*.log" -Force
Remove-Item -Path "$env:SystemRoot\*log.txt" -Force
Remove-Item -Path "$env:SystemRoot\debug\*" -Recurse -Force
Remove-Item -Path "$env:SystemRoot\logs\*" -Recurse -Force
Remove-Item -Path "$env:SystemRoot\ModemLogs\*" -Force

# Security Event Log
Remove-Item -Path "$env:SystemRoot\security\logs" -Include @('*.log', '*.old') -Force

#
Get-ChildItem -Path "$env:SystemRoot\ServiceProfiles\LocalService\AppData" -Include '*.log' -Recurse -Force | Remove-Item -Force
Get-ChildItem -Path "$env:SystemRoot\ServiceProfiles\NetworkService\AppData" -Include '*.log' -Recurse -Force | Remove-Item -Force
Get-ChildItem -Path "$env:APPDATA\Microsoft\Windows" -Include '*.log' -Recurse | Remove-Item -Force

# Windows Setup Logs
Remove-Item -Path "$env:SystemRoot\inf\setupapi.dev.log" -Force
Remove-Item -Path "$env:SystemRoot\inf\setupapi.app.log" -Force
Remove-Item -Path "$env:SystemRoot\Panther\UnattendGC\setupact.log" -Force
Remove-Item -Path "$env:SystemRoot\Panther\UnattendGC\setuperr.log" -Force
Remove-Item -Path "$env:SystemRoot\Panther\setupact.log" -Force
Remove-Item -Path "$env:SystemRoot\Panther\setuperr.log" -Force

#
Remove-Item -Path "$env:SystemRoot\Performance\WinSAT\winsat.log" -Force

# Task Scheduler Logs
Remove-Item -Path "$env:SystemRoot\SchedLgU.txt" -Force
Remove-Item -Path "$env:SystemRoot\Tasks\SchedLgU.txt" -Force
