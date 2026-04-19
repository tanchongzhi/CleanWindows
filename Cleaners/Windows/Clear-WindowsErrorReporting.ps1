<#
.SYNOPSIS
Clear Windows Error Reporting.
#>

#
# CleanerMetadata # Begin
# Title: Windows Error Reporting
# Name: Windows.ErrorReporting
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:ProgramData\Microsoft\Windows\WER\ReportArchive\*" -Recurse -Force
Remove-Item -Path "$env:ProgramData\Microsoft\Windows\WER\ReportQueue\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportArchive\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\WER\ReportQueue\*" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\ElevatedDiagnostics\*" -Recurse -Force
