<#
.SYNOPSIS
Clear Windows Tray Notifications Cache.
#>

#
# CleanerMetadata # Begin
# Title: Windows Tray Notifications Cache
# Name: Windows.TrayNotificationsCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify' -Name 'IconStreams'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify' -Name 'PastIconsStream'
