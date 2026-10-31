<#
.SYNOPSIS
Clear Internet Explorer Privacy Filter Exceptions.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer Privacy Filter Exceptions
# Name: InternetExplorer.PrivacyFilterExceptions
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\Microsoft\Windows\DNTException\*" -Recurse -Force

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Safety\Tracking Protection Exceptions' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\Safety\ActiveXFilterExceptions' -Recurse
