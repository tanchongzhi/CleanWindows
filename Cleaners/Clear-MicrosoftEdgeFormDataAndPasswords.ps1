<#
.SYNOPSIS
Clear Microsoft Edge Form Data and Passwords.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Edge Form Data and Passwords
# Name: MicrosoftEdge.FormDataAndPasswords
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Login Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Web Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Default\Account Web Data*" -Force

Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Login Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Web Data*" -Force
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge*\User Data\Profile *\Account Web Data*" -Force
