<#
.SYNOPSIS
Clear Microsoft Visual Studio History.
#>

#
# CleanerMetadata # Begin
# Title: Microsoft Visual Studio History
# Name: MicrosoftVisualStudio.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

function Clear-MicrosoftVisualStudioMRUs {
    param (
        # Version Code
        [Parameter(Mandatory = $true)]
        [int]
        $VersionCode
    )

    $configurationRoot = Get-Item -Path "$env:LOCALAPPDATA\Microsoft\VisualStudio\$VersionCode.*\"

    if (-not $configurationRoot) {
        return
    }

    $name = Split-Path -Path $configurationRoot -Leaf
    $item = Get-Item -Path "$configurationRoot\ApplicationPrivateSettings.xml"

    if ($item) {
        $xml = New-Object -TypeName System.Xml.XmlDocument
        $xml.Load($item.FullName)

        $value = $xml.DocumentElement.SelectSingleNode("/content/indexed/collection[@name='CodeContainers.Offline']/value[@name='value']")

        if ($value) {
            $value.InnerText = '[]'

            $encoding = New-Object -TypeName System.Text.UTF8Encoding -ArgumentList $false
            $writer = New-Object -TypeName System.IO.StreamWriter -ArgumentList $item.FullName, $false, $encoding

            try {
                $xml.Save($writer)
            } finally {
                $writer.Dispose()
            }
        }
    }

    $item = Get-Item -Path "$configurationRoot\privateregistry.bin"

    if ($item) {
        $null = New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS

        $null = reg load "HKU\VisualStudio_$name" $item.FullName

        try {
            Remove-Item -Path "HKU:\VisualStudio_$name\Software\Microsoft\VisualStudio\$name\MRUItems" -Recurse
        } finally {
            $null = reg unload "HKU\VisualStudio_$name"
        }
    }
}

Clear-MicrosoftVisualStudioMRUs -VersionCode 15
Clear-MicrosoftVisualStudioMRUs -VersionCode 16
Clear-MicrosoftVisualStudioMRUs -VersionCode 17
