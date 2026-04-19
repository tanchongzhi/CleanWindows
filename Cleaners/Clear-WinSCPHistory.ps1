<#
.SYNOPSIS
Clear WinSCP History.
#>

#
# CleanerMetadata # Begin
# Title: WinSCP History
# Name: WinSCP.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Martin Prikryl\WinSCP 2\Configuration\History' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Martin Prikryl\WinSCP 2\Configuration\CDCache' -Recurse
