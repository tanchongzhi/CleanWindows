<#
.SYNOPSIS
Clear Windows Start Menu Order.
#>

#
# CleanerMetadata # Begin
# Title: Windows Start Menu Order
# Name: Windows.StartMenuOrder
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MenuOrder' -Recurse
