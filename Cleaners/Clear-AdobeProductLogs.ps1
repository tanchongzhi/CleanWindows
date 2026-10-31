<#
.SYNOPSIS
Clear Adobe Products Logs.
#>

#
# CleanerMetadata # Begin
# Title: Adobe Product Logs
# Name: Adobe.ProductLogs
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

$items = Get-ChildItem -Path "$env:APPDATA\Adobe" -Include 'Logs' -Recurse -Force | Where-Object { $_.PSIsContainer }
$items | ForEach-Object { Remove-Item -Path $_.FullName -Recurse -Force }
