<#
.SYNOPSIS
Clear Windows Paint History.
#>

#
# CleanerMetadata # Begin
# Title: Windows Paint History
# Name: Windows.Paint.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List' -Recurse
