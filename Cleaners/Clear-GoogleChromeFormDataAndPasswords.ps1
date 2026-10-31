<#
.SYNOPSIS
Clear Google Chrome Form Data and Passwords.
#>

#
# CleanerMetadata # Begin
# Title: Google Chrome Form Data and Passwords
# Name: GoogleChrome.FormDataAndPasswords
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\Login Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\Web Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Default\Account Web Data*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\Login Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\Web Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Google\Chrome*\User Data\Profile *\Account Web Data*" -Force
