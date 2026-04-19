<#
.SYNOPSIS
Clear Windows Clipboard.
#>

#
# CleanerMetadata # Begin
# Title: Windows Clipboard
# Name: Windows.Clipboard
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

if (-not ('WindowsNativeMethods.Clipboard' -as [type])) {
    Add-Type -Namespace WindowsNativeMethods -Name Clipboard -MemberDefinition @'
[DllImport("user32.dll")]
public static extern byte OpenClipboard(IntPtr hWndNewOwner);

[DllImport("user32.dll")]
public static extern byte CloseClipboard();

[DllImport("user32.dll")]
public static extern byte EmptyClipboard();
'@
}

function Clear-Clipboard {
    try {
        $r = [WindowsNativeMethods.Clipboard]::OpenClipboard([System.IntPtr]::Zero)

        if ($r -eq 0) {
            return
        }

        $r = [WindowsNativeMethods.Clipboard]::EmptyClipboard()
        $null = [WindowsNativeMethods.Clipboard]::CloseClipboard()
    } catch {
        #
    }
}

Clear-Clipboard
