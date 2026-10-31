<#
.SYNOPSIS
Clear VS Code Local History.
#>

#
# CleanerMetadata # Begin
# Title: VSCode Local History
# Name: VSCode.LocalHistory
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Code\History" -Recurse -Force
