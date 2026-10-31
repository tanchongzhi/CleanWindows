<#
.SYNOPSIS
Clear Windows Defender History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Defender History
# Name: Windows.Defender.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

if ([System.Environment]::OSVersion.Version.Major -le 6) {
    Remove-Item -Path "$env:ProgramData\Microsoft\Windows Defender\Scans\History\*" -Recurse -Force
    Remove-Item -Path "$env:ProgramData\Microsoft\Windows Defender\Support\*" -Recurse -Force
} else {
    $WindowsDefenderDataRoot = "$env:ProgramData\Microsoft\Windows Defender"

    $taskName = 'ClearWinDefenderHistoryOnStartupOnce'
    $taskDescription = 'ClearWinDefenderHistoryOnStartupOnce'

    $cmdCommands = @(
        "rd /S /Q `"$WindowsDefenderDataRoot\Scans\Quarantine\*`"",
        "rd /S /Q `"$WindowsDefenderDataRoot\Scans\History\Service`"",
        "rd /S /Q `"$WindowsDefenderDataRoot\Scans\History\Results`"",
        "del /F /Q `"$WindowsDefenderDataRoot\Scans\Support\*`"",
        "del /F /Q `"$WindowsDefenderDataRoot\Scans\mpenginedb.db*`"",
        "schtasks /Delete /TN `"$taskName`" /F"
    )

    $cmdArgument = '/c ' + ($cmdCommands -join ' & ')

    $taskAction = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument $cmdArgument
    $taskTrigger = New-ScheduledTaskTrigger -AtStartup
    $taskPrinciple = New-ScheduledTaskPrincipal -UserId SYSTEM -LogonType ServiceAccount
    $taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

    Register-ScheduledTask -TaskName $taskName -Description $taskDescription -Action $taskAction -Trigger $taskTrigger -Principal $taskPrinciple -Settings $taskSettings -Force | Out-Null

    wevtutil clear-log 'Microsoft-Windows-Windows Defender/Operational'
    wevtutil clear-log 'Microsoft-Windows-Windows Defender/WHC'
}
