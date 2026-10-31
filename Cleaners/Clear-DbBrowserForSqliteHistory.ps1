<#
.SYNOPSIS
Clear DbBrowser For SQLite History.
#>

#
# CleanerMetadata # Begin
# Title: DbBrowser For SQLite History
# Name: DbBrowserForSQLite.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-ItemProperty -Path 'HKCU:\SOFTWARE\sqlitebrowser\sqlitebrowser\General' -Name 'recentFileList'
