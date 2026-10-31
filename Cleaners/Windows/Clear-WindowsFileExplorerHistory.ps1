<#
.SYNOPSIS
Clear Windows File Explorer History.
#>

#
# CleanerMetadata # Begin
# Title: Windows File Explorer History
# Name: Windows.FileExplorer.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

# Window Size and Location History
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Streams' -Recurse

# Dialog MRUs
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU' -Recurse

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FindComputerMRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\PrnPortsMRU' -Recurse

# Typed Paths
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths' -Recurse

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComputerDescriptions' -Name 'Id'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComputerDescriptions' -Name 'Name'

# UserAssist
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\*\Count' -Recurse
