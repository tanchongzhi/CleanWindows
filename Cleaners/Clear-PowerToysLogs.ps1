<#
.SYNOPSIS
Clear PowerToys Logs.
#>

#
# CleanerMetadata # Begin
# Title: PowerToys Logs
# Name: PowerToys.Logs
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

$process = Get-Process -Name PowerToys
$processPath = $process.Path

Stop-Process -Name PowerToys

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\*\Logs" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\*\ModuleInterface\Logs" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\*\LogsModuleInterface" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\RunnerLogs" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\PowerToys\UpdateLogs" -Recurse -Force

if ($processPath) {
    & $processPath --restartedElevated
}
