<#
.SYNOPSIS
Clear Python Pip Cache.
#>

#
# CleanerMetadata # Begin
# Title: Python Pip Cache
# Name: Pip.Cache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\pip\cache" -Recurse -Force
