# CleanWindows

A collection of modular, zero-dependency cleanup scripts for Windows, managed by a single entry script.

## Requirements

* **Windows 7** or later.
* **Administrator privileges** are required to run the entry script (`Invoke-Cleaner.ps1`), as some cleaning modules modify system directories or registry keys.

## Usage

You can start the cleanup process by running `Invoke-Cleaner.ps1` (or `Invoke-Cleaner.cmd`) in an elevated PowerShell prompt. The script provides several parameters to control which modules are executed:

**Interactive mode**
Prompts you to select which items to clean.
```powershell
.\Invoke-Cleaner.ps1 -Interactive
```

**List available modules**
Lists all recognized cleaning modules found in the `Cleaners` directory.
```powershell
.\Invoke-Cleaner.ps1 -ListAvailable
```

**Clean specific modules**
Runs only the specified modules (comma-separated).
```powershell
.\Invoke-Cleaner.ps1 -Name MicrosoftOffice.History, Windows.TemporaryFiles
```

**Clean specific groups**
Runs only the specified groups (comma-separated).
```powershell
.\Invoke-Cleaner.ps1 -Name MicrosoftOffice, Windows
```

**Clean all modules**
Executes every available cleaning script.
```powershell
.\Invoke-Cleaner.ps1 -All
```

**Clean all except specific modules**
Executes all scripts, but skips the ones you specify.
```powershell
.\Invoke-Cleaner.ps1 -All -Exclude GoogleChrome.Cookies, MicrosoftEdge.Cookies
```

## Adding Custom Cleaners

All cleaning modules are stored in the `Cleaners` folder and its subdirectories. You can add your own standalone PowerShell scripts there.

The project follows a `Clear-<name>.ps1` file naming convention. If you create a script named `Clear-YourAppCache.ps1`, the entry script will automatically identify its module name as `YourAppCache`.

If you prefer to define a specific identifier (especially ones with dots, like `YourApp.Cache`), you can add a metadata comment block at the beginning of your script:

```powershell
#
# CleanerMetadata # Begin
# Title: YourApp Cache
# Name: YourApp.Cache
# CleanerMetadata # End
#

# Your cleanup code here...
Remove-Item -Path "$env:LOCALAPPDATA\YourApp\Cache\*" -Recurse -Force
```
*Note: If this metadata block is present, the script will use it. Otherwise, it falls back to extracting the `<name>` part from the `Clear-<name>.ps1` filename.*

## Disclaimer

This tool permanently deletes files and registry keys. Please review the individual scripts in the `Cleaners` folder to ensure you understand what is being removed before running them. Use at your own risk.
