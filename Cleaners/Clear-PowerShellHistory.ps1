<#
.SYNOPSIS
Clear PowerShell History.
#>

#
# CleanerMetadata # Begin
# Title: PowerShell History
# Name: PowerShell.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

$module = Get-Module -Name PSReadLine

if ($module) {
    Remove-Item -Path (Get-PSReadLineOption).HistorySavePath
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
} else {
    $null = [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
    [System.Windows.Forms.SendKeys]::SendWait('%{F7 2}')
}

Clear-History
