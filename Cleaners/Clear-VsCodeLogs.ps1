<#
.SYNOPSIS
Clear VS Code Logs.
#>

#
# CleanerMetadata # Begin
# Title: VSCode Logs
# Name: VSCode.Logs
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Code\logs" -Recurse -Force
