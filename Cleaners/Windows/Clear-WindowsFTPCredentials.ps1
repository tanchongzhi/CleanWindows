<#
.SYNOPSIS
Clear Windows FTP Credentials.
#>

#
# CleanerMetadata # Begin
# Title: Windows FTP Credentials
# Name: Windows.FTPCredentials
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Ftp\Accounts' -Recurse
