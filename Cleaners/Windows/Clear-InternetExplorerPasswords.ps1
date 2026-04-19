<#
.SYNOPSIS
Clear Internet Explorer Passwords.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer Passwords
# Name: InternetExplorer.Passwords
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\Storage2' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\SPW' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Ftp\Accounts' -Recurse
