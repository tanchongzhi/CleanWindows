<#
.SYNOPSIS
Clear Windows Media Player History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Media Player History
# Name: Windows.MediaPlayer.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Name 'LastPlayList'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Preferences' -Name 'LastPlayListIndex'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Services\MediaGuide' -Name 'CachedIconPath'
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Services\MediaGuide' -Name 'CachedLargeLogoPath'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Media Player\lastplayed.wpl" -Force

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Player\RecentFileList' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Player\RecentURLList' -Recurse
Remove-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Player\Settings' -Name 'SaveAsDir'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\AutoComplete\MediaEdit' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\MediaPlayer\Radio\MRUList' -Recurse
