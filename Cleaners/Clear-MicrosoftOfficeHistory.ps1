<#
.SYNOPSIS
Clear Microsoft Office History.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Office History
# Name: MicrosoftOffice.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Access\File MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Access\Place MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Access\User MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Word\File MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Word\Place MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Word\User MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Excel\File MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Excel\Place MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Excel\User MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Publisher\File MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Publisher\Place MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Publisher\User MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\PowerPoint\File MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\PowerPoint\Place MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\PowerPoint\User MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\OneNote\RecentNotebooks' -Recurse
