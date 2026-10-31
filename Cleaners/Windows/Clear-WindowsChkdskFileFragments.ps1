<#
.SYNOPSIS
Clear Windows Chkdsk File Fragments.
#>

#
# CleanerMetadata # Begin
# Title: Windows Chkdsk File Fragments
# Name: Windows.ChkdskFileFragments
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:SystemDrive\File*.chk" -Force
