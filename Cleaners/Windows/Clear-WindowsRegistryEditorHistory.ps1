<#
.SYNOPSIS
Clear Windows Registry Editor History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Registry Editor History
# Name: Windows.RegistryEditor.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit' -Name 'LastKey'
