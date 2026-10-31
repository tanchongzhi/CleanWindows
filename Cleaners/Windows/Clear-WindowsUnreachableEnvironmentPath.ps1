<#
.SYNOPSIS
Clear Windows Unreachable Environment Path.
#>

#
# CleanerMetadata # Begin
# Title: Windows Unreachable Environment Path
# Name: Windows.UnreachableEnvironmentPath
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

function Remove-UnreachableEnvironmentPathCore {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $KeyPath
    )

    $pathValue = (Get-ItemProperty -Path $KeyPath).Path
    $directories = $pathValue.Split(';', [System.StringSplitOptions]::RemoveEmptyEntries) |
        Where-Object -FilterScript { Test-Path -Path ([System.Environment]::ExpandEnvironmentVariables($_)) -PathType Container }

    $pathValue = $directories -join ';'
    $null = Set-ItemProperty -Path $KeyPath -Name Path -Value $pathValue -Force
}

function Remove-UnreachableEnvironmentPath {
    try {
        Remove-UnreachableEnvironmentPathCore -KeyPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\'
    } catch {
        #
    }

    try {
        Remove-UnreachableEnvironmentPathCore -KeyPath 'HKCU:\Environment\'
    } catch {
        #
    }
}

Remove-UnreachableEnvironmentPath
