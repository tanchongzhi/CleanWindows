<#
.SYNOPSIS
Clear Microsoft Edge History.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Edge History
# Name: MicrosoftEdge.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Current Session" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Current Tabs" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Last Session" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Last Tabs" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Sessions" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Archived History*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\History*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Favicons*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\JumpListIconsMostVisited" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\JumpListIconsRecentClosed" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Shortcuts*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Top Sites*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Visited Links" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Current Session" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Current Tabs" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Last Session" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Last Tabs" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Sessions" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Archived History*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\History*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Favicons*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\JumpListIconsMostVisited" -Recurse -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\JumpListIconsRecentClosed" -Recurse -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Shortcuts*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Top Sites*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Visited Links" -Force
