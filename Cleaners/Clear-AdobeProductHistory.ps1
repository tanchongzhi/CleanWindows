<#
.SYNOPSIS
Clear Adobe Product History.
#>

#
# CleanerMetadata # Begin
# Title: Adobe Product History
# Name: Adobe.ProductHistory
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\MediaBrowser\MRU' -Recurse

Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Acrobat Reader\10.0\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Acrobat Reader\11.0\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Acrobat Reader\DC\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Acrobat Reader\DC\AVGeneral\cRecentFolders' -Recurse

Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\9.0\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\10.0\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\11.0\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\11.0\CompoundDocs\cStoredBinder' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\DC\AVGeneral\cRecentFiles' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\DC\AVGeneral\cRecentFolders' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Adobe Acrobat\DC\AVGeneral\cRecentToolsList' -Recurse


Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Photoshop\*\VisitedDirs' -Recurse

Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Photoshop Elements\*\CurrentMediaFilePath' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Photoshop Elements\*\common\settings\Elements MRU' -Recurse
Remove-Item -Path 'HKCU:\SOFTWARE\Adobe\Photoshop Elements\*\VisitedDirs' -Recurse
