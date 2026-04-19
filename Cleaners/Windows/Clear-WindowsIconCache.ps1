<#
.SYNOPSIS
Clear Windows Icon Cache.
#>

#
# CleanerMetadata # Begin
# Title: Windows Icon Cache
# Name: Windows.IconCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\IconCache.db" -Force
