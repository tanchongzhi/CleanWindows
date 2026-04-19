<#
.SYNOPSIS
Clear Go Language Server Cache.
#>

#
# CleanerMetadata # Begin
# Title: Go Language Server Cache
# Name: Go.LanguageServerCache
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\gopls" -Recurse -Force
