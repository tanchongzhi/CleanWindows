<#
.SYNOPSIS
Clear 7-Zip History.
#>

#
# CleanerMetadata # Begin
# Title: 7-Zip History
# Name: 7Zip.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\7-Zip\FM' -Name 'CopyHistory'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\7-Zip\FM' -Name 'FolderHistory'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\7-Zip\FM' -Name 'PanelPath0'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\7-Zip\Compression' -Name 'ArcHistory'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\7-Zip\Extraction' -Name 'PathHistory'
