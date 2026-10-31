<#
.SYNOPSIS
Clear Calibre History.
#>

#
# CleanerMetadata # Begin
# Title: Calibre History
# Name: Calibre.History
# CleanerMetadata # End
#

$ErrorActionPreference = 'SilentlyContinue'

Remove-Item -Path "$env:APPDATA\calibre\viewer" -Recurse -Force
Remove-Item -Path "$env:APPDATA\calibre\store" -Recurse -Force
Remove-Item -Path "$env:APPDATA\calibre\edit-book-dynamic.pickle.json" -Force
Remove-Item -Path "$env:APPDATA\calibre\edit-book-history.plist" -Force
Remove-Item -Path "$env:APPDATA\calibre\viewer-webengine.json" -Recurse -Force


if (Test-Path -Path "$env:APPDATA\calibre\gui.json") {
    $content = Get-Content -Path "$env:APPDATA\calibre\gui.json"

    $obj = if ($PSVersionTable.PSVersion.Major -le 2) {
        Add-Type -AssemblyName System.Web.Extensions

        $serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
        $serializer.DeserializeObject($content)
    } else {
        $content | ConvertFrom-Json
    }

    @('library_usage_stats', 'geometry-of-calibre_main_window_geometry', 'geometry-of-preferences dialog geometry') | ForEach-Object {
        if ($PSVersionTable.PSVersion.Major -le 2) {
            if ($obj.ContainsKey($_)) {
                $obj.Remove($_) | Out-Null
            }
        } else {
            $obj.psobject.Properties.Remove($_)
        }
    }

    $newContent = if ($PSVersionTable.PSVersion.Major -le 2) {
        $serializer.Serialize($obj)
    } else {
        $obj | ConvertTo-Json
    }

    $newContent | Set-Content "$env:APPDATA\calibre\gui.json" -Encoding UTF8
}
