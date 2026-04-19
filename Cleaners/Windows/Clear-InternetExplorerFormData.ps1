<#
.SYNOPSIS
Clear Internet Explorer Form Data.
#>

#
# CleanerMetadata # Begin
# Title: Internet Explorer Form Data
# Name: InternetExplorer.FormData
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\FormData' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\Storage1' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\SPW' -Recurse
