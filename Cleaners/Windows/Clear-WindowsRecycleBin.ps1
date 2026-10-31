<#
.SYNOPSIS
Clear Windows Recycle Bin.
#>

#
# CleanerMetadata # Begin
# Title: Windows Recycle Bin
# Name: Windows.RecycleBin
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

if ($PSVersionTable.PSVersion.Major -lt 5) {
    if (-not ('WindowsNativeMethods.RecycleBin' -as [type])) {
        Add-Type -Namespace WindowsNativeMethods -Name RecycleBin -MemberDefinition @'
    [DllImport("Shell32.dll", CharSet = CharSet.Unicode)]
    public static extern uint SHEmptyRecycleBin(IntPtr hwnd, string pszRootPath, uint dwFlags);
'@
    }

    function Clear-RecycleBin {
        param (
            [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
            [string]
            $DriveLetter,

            [Parameter()]
            [switch]
            $Force
        )

        process {
            if ($DriveLetter -notmatch '[a-zA-Z]:\\?') {
                return $false
            }
            if ($DriveLetter.EndsWith(':')) {
                $DriveLetter += '\'
            }

            # SHERB_NOCONFIRMATION = 0x00000001, SHERB_NOPROGRESSUI = 0x00000002, SHERB_NOSOUND = 0x00000004
            [uint32]$dwFlags = 7

            $null = [WindowsNativeMethods.RecycleBin]::SHEmptyRecycleBin([System.IntPtr]::Zero, $DriveLetter, $dwFlags)
            $lastError = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error()

            $succeedCodes = @(0, 203, 18)

            return $succeedCodes -contains $lastError
        }
    }
}

$drives = [System.IO.DriveInfo]::GetDrives()
$drives = $drives | Where-Object {
    $_.IsReady -and ($_.DriveType -eq [System.IO.DriveType]::Fixed)
}
$drives | ForEach-Object {
    $null = Clear-RecycleBin -DriveLetter $_.Name -Force -ErrorAction SilentlyContinue
}
