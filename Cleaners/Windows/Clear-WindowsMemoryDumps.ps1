<#
.SYNOPSIS
Clear Windows Memory Dumps.
#>

#
# CleanerMetadata # Begin
# Title: Windows Memory Dumps
# Name: Windows.MemoryDumps
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:SystemRoot\memory.dmp" -Force
Remove-Item -Path "$env:SystemRoot\Minidump\*.dmp" -Force
Remove-Item -Path "$env:SystemRoot\LiveKernelReports\*.dmp" -Force
Remove-Item -Path "$env:ProgramData\Miscrosoft\Dr Watson\*.dmp" -Force
Remove-Item -Path "$env:LOCALAPPDATA\CrashDumps\*.dmp" -Force
