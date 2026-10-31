<#
.SYNOPSIS
Clear Windows Wallpaper History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Wallpaper History
# Name: Windows.WallpaperHistory
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpaper\MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images' -Recurse
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers' -Name 'BackgroundHistoryPath0'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers' -Name 'BackgroundHistoryPath1'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers' -Name 'BackgroundHistoryPath2'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers' -Name 'BackgroundHistoryPath3'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers' -Name 'BackgroundHistoryPath4'
