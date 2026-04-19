<#
.SYNOPSIS
Clean Windows.
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true, ParameterSetName = 'ListAvailable')]
    [switch]
    $ListAvailable,

    [Parameter(Mandatory = $true, ParameterSetName = 'CleanSelectedOnly')]
    [ValidateNotNull()]
    [ValidateScript({ $_ -match '^(?:[\w-]+\.)*[\w-]+$' })]
    [string[]]
    $Name,

    [Parameter(Mandatory = $true, ParameterSetName = 'CleanAllExcludeSelected')]
    [switch]
    $All,

    [Parameter(ParameterSetName = 'CleanAllExcludeSelected')]
    [ValidateNotNull()]
    [ValidateScript({ $_ -match '^(?:[\w-]+\.)*[\w-]+$' })]
    [string[]]
    $Exclude,

    [Parameter(Mandatory = $true, ParameterSetName = 'CleanInteractive')]
    [switch]
    $Interactive
)

if ($PSVersionTable.PSVersion.Major -le 2) {
    $PSScriptRoot = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
}

$CleanerMetadataBeginTag = '# CleanerMetadata # Begin'
$CleanerMetadataEndTag = '# CleanerMetadata # End'

function Get-Cleaner {
    Get-ChildItem -Path "$PSScriptRoot\Cleaners" -Include 'Clear-*.ps1' -Recurse -Force | ForEach-Object {
        if ($_.PSIsContainer) {
            return
        }

        $lines = @(Get-Content -Path $_.FullName -Force)

        $cleanerMetadata = @{}
        $cleanerMetadataBegin = $false
        $cleanerMetadataEnd = $false

        for ($i = 0; $i -lt $lines.Count; $i++) {
            $line = $lines[$i].Trim()

            if ($line -eq $CleanerMetadataBeginTag) {
                $cleanerMetadataBegin = $true
                continue
            }

            if ($line -eq $CleanerMetadataEndTag) {
                $cleanerMetadataEnd = $true
                break
            }

            if ($cleanerMetadataBegin) {
                if ($line -match '^[\s#]*$') {
                    continue
                }

                if ($line -match '^# (?<name>[\w.-]+)\s*:\s*(?<value>.*)$') {
                    $cleanerMetadata[$Matches['name']] = $Matches['value']
                } else {
                    Write-Warning "Invalid Cleaner Metadata, Line $($i + 1): $($_.FullName)"
                    break
                }
            }
        }

        if (-not $cleanerMetadataBegin -bxor -not $cleanerMetadataEnd) {
            Write-Warning "Invalid Cleaner Metadata: $($_.FullName)"
        }

        $name = if ([string]::IsNullOrEmpty($cleanerMetadata['Name'])) {
            $_.BaseName.Substring('Clear-'.Length)
        } else {
            $cleanerMetadata['Name']
        }

        $title = if ([string]::IsNullOrEmpty($cleanerMetadata['Title'])) {
            $name
        } else {
            $cleanerMetadata['Title']
        }

        New-Object -TypeName psobject -Property @{ Title = $title; Name = $name; Path = $_.FullName; }
    }
}

function Invoke-PowerShellScript {
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Path
    )

    & $env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NonInteractive -Command "& { & '$Path' }"
}

$InteractiveConfigurationPath = "$env:LOCALAPPDATA\CleanWindows\Interactive.json"

function Import-CleanWindowsUIConfiguration {
    if (Test-Path -Path $InteractiveConfigurationPath) {
        $content = Get-Content -Path $InteractiveConfigurationPath

        if ($PSVersionTable.PSVersion.Major -le 2) {
            $null = [System.Reflection.Assembly]::LoadWithPartialName('System.Web.Extensions')
            $serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
            $serializer.DeserializeObject($content)
        } else {
            $content | ConvertFrom-Json
        }
    }
}

function Save-CleanWindowsUIConfiguration {
    param (
        [Parameter(Mandatory = $true)]
        [hashtable]
        $Configuration
    )

    $directory = Split-Path -Path $InteractiveConfigurationPath -Parent

    if (-not (Test-Path -Path $directory)) {
        New-Item -Path $directory -ItemType Directory -Force | Out-Null
    }

    $content = if ($PSVersionTable.PSVersion.Major -le 2) {
        Add-Type -AssemblyName System.Web.Extensions

        $serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
        $serializer.Serialize($Configuration)
    } else {
        $Configuration | ConvertTo-Json
    }

    $content | Set-Content $InteractiveConfigurationPath -Encoding UTF8
}

$SelectableCleanerInfoDefinition = @'
using System.ComponentModel;
using System.Management.Automation;

namespace CleanWindowsUI {
    public class SelectableCleanerInfo : INotifyPropertyChanged {
        private bool _isSelected;

        public PSObject Data { get; set; }

        public string Title {
            get {
                PSPropertyInfo property = Data.Properties["Title"];

                return property == null ? string.Empty : (string)property.Value;
            }
        }

        public string Name {
            get {
                PSPropertyInfo property = Data.Properties["Name"];

                return property == null ? string.Empty : (string)property.Value;
            }
        }

        public bool IsSelected
        {
            get { return _isSelected; }
            set { _isSelected = value; OnPropertyChanged("IsSelected"); }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged(string propertyName) {
            if (PropertyChanged != null) {
                PropertyChanged.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
'@

[xml]$CleanerMainWindowXaml = @'
<?xml version="1.0" encoding="UTF-8" ?>
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Clean Windows"
        WindowStartupLocation="CenterScreen" MinHeight="480" MinWidth="640" Height="480" Width="640">
    <Grid Margin="8">
        <Grid.RowDefinitions>
            <RowDefinition Height="28" />
            <RowDefinition Height="*" />
            <RowDefinition Height="28" />
        </Grid.RowDefinitions>

        <Grid Grid.Row="0">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="Auto" />
                <ColumnDefinition Width="*" />
                <ColumnDefinition Width="Auto" />
                <ColumnDefinition Width="Auto" />
            </Grid.ColumnDefinitions>

            <ComboBox Grid.Column="0" x:Name="CleanModeComboBox" IsReadOnly="True" SelectedIndex="0" VerticalContentAlignment="Center" Width="180">
                <ComboBox.ItemContainerStyle>
                    <Style TargetType="{x:Type ComboBoxItem}">
                        <Setter Property="Height" Value="24" />
                        <Setter Property="VerticalContentAlignment" Value="Center" />
                    </Style>
                </ComboBox.ItemContainerStyle>

                <ComboBoxItem Content="Clean all, exclude selected" Tag="CleanAllExcludeSelected" />
                <ComboBoxItem Content="Clean selected only" Tag="CleanSelectedOnly" />
            </ComboBox>

            <Label Grid.Column="2" Content="Filter" />
            <TextBox Grid.Column="3" x:Name="CleanerFilterTextBox" VerticalContentAlignment="Center" Padding="4,0" MinWidth="240" />
        </Grid>

        <ListView Grid.Row="1" x:Name="CleanerListView" Margin="0,8">
            <ListView.View>
                <GridView AllowsColumnReorder="False">
                    <GridView.Columns>
                        <GridViewColumn>
                            <GridViewColumn.CellTemplate>
                                <DataTemplate>
                                    <Grid>
                                        <CheckBox IsChecked="{Binding Path=IsSelected, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}"  HorizontalAlignment="Center" VerticalAlignment="Center" />
                                    </Grid>
                                </DataTemplate>
                            </GridViewColumn.CellTemplate>
                        </GridViewColumn>

                        <GridViewColumn Header="Title" DisplayMemberBinding="{Binding Title}" Width="Auto" />
                        <GridViewColumn Header="Name" DisplayMemberBinding="{Binding Name}" Width="Auto" />
                    </GridView.Columns>
                </GridView>
            </ListView.View>

            <ListView.ContextMenu>
                <ContextMenu>
                    <MenuItem x:Name="CleanerListViewMenuItem_DeselectAll" Header="Deselect All" />
                </ContextMenu>
            </ListView.ContextMenu>
        </ListView>

        <StackPanel Grid.Row="2" Orientation="Horizontal" HorizontalAlignment="Right">
            <Button x:Name="CleanButton" Content="Clean" Margin="8,0" MinWidth="96" />
            <Button x:Name="CancelButton" Content="Cancel" MinWidth="96" />
        </StackPanel>
    </Grid>
</Window>
'@

function Show-CleanerSelectionWindow {
    Add-Type -AssemblyName PresentationFramework
    Add-Type -TypeDefinition $SelectableCleanerInfoDefinition

    $cleanerCollection = New-Object -TypeName System.Collections.ObjectModel.ObservableCollection[CleanWindowsUI.SelectableCleanerInfo]
    Get-Cleaner | ForEach-Object { $cleanerCollection.Add((New-Object -TypeName CleanWindowsUI.SelectableCleanerInfo -Property @{ Data = $_ })) }

    $window = [System.Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $CleanerMainWindowXaml))

    $cleanModeComboBox = $window.FindName('CleanModeComboBox')
    $cleanerFilterTextBox = $window.FindName('CleanerFilterTextBox')
    $cleanerListView = $window.FindName('CleanerListView')
    $cleanerListViewMenuItemDeselectAll = $window.FindName('CleanerListViewMenuItem_DeselectAll')
    $cleanButton = $window.FindName('CleanButton')
    $cancelButton = $window.FindName('CancelButton')

    $cleanerCollectionViewSource = New-Object -TypeName System.Windows.Data.CollectionViewSource
    $cleanerCollectionViewSource.Source = $cleanerCollection

    $cleanerCollectionViewSource.add_Filter(
        {
            param ($Sender_, $FilterEventArgs)

            if ([string]::IsNullOrEmpty($cleanerFilterTextBox.Text) -or ($cleanerFilterTextBox.Text -match '^\s*$')) {
                $FilterEventArgs.Accepted = $true
                return
            }

            if ($null -eq $FilterEventArgs.Item) {
                $FilterEventArgs.Accepted = $false
                return
            }

            $FilterEventArgs.Accepted = $FilterEventArgs.Item.Name.IndexOf($cleanerFilterTextBox.Text.Trim(), [System.StringComparison]::OrdinalIgnoreCase) -ge 0
        }
    )

    $cleanerCollectionView = $cleanerCollectionViewSource.View

    $cleanerCollectionView.SortDescriptions.Add((New-Object -TypeName System.ComponentModel.SortDescription -ArgumentList @('IsSelected', [System.ComponentModel.ListSortDirection]::Descending)))
    $cleanerCollectionView.SortDescriptions.Add((New-Object -TypeName System.ComponentModel.SortDescription -ArgumentList @('Name', [System.ComponentModel.ListSortDirection]::Ascending)))

    if ($cleanerCollectionView -is [System.ComponentModel.ICollectionViewLiveShaping]) {
        if ($cleanerCollectionView.CanChangeLiveSorting) {
            $cleanerCollectionView.LiveSortingProperties.Add('IsSelected')
            $cleanerCollectionView.IsLiveSorting = $true
        }
    }

    $cleanerListView.ItemsSource = $cleanerCollectionView

    $cleanModeComboBox.add_SelectionChanged(
        {
            if ($null -eq $cleanerCollectionView) {
                return
            }

            foreach ($item in $cleanerCollectionView) {
                $item.IsSelected = $false
            }

            $cleanerCollectionView.Refresh()
        }
    )

    $cleanerFilterTextBox.add_TextChanged(
        {
            $cleanerCollectionView.Refresh()
        }
    )

    $cleanerListViewMenuItemDeselectAll.add_Click(
        {
            foreach ($item in $cleanerCollectionView) {
                $item.IsSelected = $false
            }

            $cleanerCollectionView.Refresh()
        }
    )

    $cleanButton.add_Click(
        {
            $cleanModeComboBox.Tag = $cleanModeComboBox.SelectedItem.Tag
            $window.DialogResult = $true
        }
    )

    $cancelButton.add_Click(
        {
            $window.Close()
        }
    )

    $configuration = Import-CleanWindowsUIConfiguration

    if ($configuration.Mode -eq 'CleanAllExcludeSelected') {
        $cleanModeComboBox.SelectedItem = $cleanModeComboBox.Items | Where-Object { $_.Tag -eq 'CleanAllExcludeSelected' }
    } elseif ($configuration.Mode -eq 'CleanSelectedOnly') {
        $cleanModeComboBox.SelectedItem = $cleanModeComboBox.Items | Where-Object { $_.Tag -eq 'CleanSelectedOnly' }
    }

    if ($configuration.Selected) {
        foreach ($item in $cleanerCollectionView) {
            if ($configuration.Selected -contains $item.Name) {
                $item.IsSelected = $true
            }
        }
    }

    if ($window.ShowDialog()) {
        $mode = $cleanModeComboBox.Tag
        $selected = @($cleanerCollection | Where-Object { $_.IsSelected }) | ForEach-Object { $_.Name }
        $configuration = @{ Mode = $mode; Selected = $selected }

        Save-CleanWindowsUIConfiguration -Configuration $configuration

        $cleaners = @($cleanerCollection | ForEach-Object { $_.Data })

        @{ Cleaners = $cleaners; Configuration = $configuration; }
    }
}

[xml]$CleanerRunningStateWindowXaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Clean Windows"
        WindowStartupLocation="CenterScreen" ShowInTaskbar="False" Topmost="True" SizeToContent="Height" ResizeMode="NoResize" Width="640">
    <Grid Margin="8">
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto" />
            <RowDefinition Height="Auto" />
        </Grid.RowDefinitions>

        <TextBlock Grid.Row="0" x:Name="CleanerRunningStateTextBlock" Margin="0,8" />
        <Button Grid.Row="1" x:Name="CancelButton" Content="_Cancel" Height="28" Width="96" />
    </Grid>
</Window>
'@

function Show-CleanerRunningStateWindow {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [psobject[]]
        $Cleaner
    )

    Add-Type -AssemblyName PresentationFramework

    $synchronizedContext = [hashtable]::Synchronized(
        @{
            IsCancellationRequested   = $false
            WindowLoaded              = New-Object -TypeName System.Threading.ManualResetEvent -ArgumentList $false
            WindowClosed              = New-Object -TypeName System.Threading.ManualResetEvent -ArgumentList $false
            UpdateCleanerRunningState = $null
            CloseWindow               = $null
        }
    )

    $runspace = [runspacefactory]::CreateRunspace()
    $runspace.ApartmentState = 'STA'
    $runspace.Open()
    $runspace.SessionStateProxy.SetVariable('synchronizedContext', $synchronizedContext)
    $runspace.SessionStateProxy.SetVariable('cleanerRunningStateWindowXaml', $CleanerRunningStateWindowXaml)

    $powershell = [powershell]::Create()
    $powershell.Runspace = $runspace
    $powershell.AddScript(
        {
            $window = [System.Windows.Markup.XamlReader]::Load((New-Object -TypeName System.Xml.XmlNodeReader -ArgumentList $cleanerRunningStateWindowXaml))

            $cleanerRunningStateTextBlock = $window.FindName('CleanerRunningStateTextBlock')
            $cancelButton = $window.FindName('CancelButton')

            $synchronizedContext.UpdateCleanerRunningState = {
                param ([string]$Text)

                $cleanerRunningStateTextBlock.Dispatcher.Invoke(
                    [action] {
                        $cleanerRunningStateTextBlock.Text = $Text
                    }
                )
            }

            $synchronizedContext.CloseWindow = {
                $window.Dispatcher.Invoke(
                    [action] {
                        $window.Close()
                    }
                )
            }

            $window.add_Loaded(
                {
                    $synchronizedContext.WindowLoaded.Set()
                }
            )

            $window.add_Closed(
                {
                    $synchronizedContext.WindowClosed.Set()
                    $synchronizedContext.IsCancellationRequested = $true
                }
            )

            $cancelButton.add_Click(
                {
                    $synchronizedContext.IsCancellationRequested = $true

                    $cancelButton.Content = 'Canceling...'
                    $cancelButton.IsEnabled = $false
                }
            )

            $window.ShowDialog() | Out-Null
        }
    ) | Out-Null

    $powershell.BeginInvoke() | Out-Null
    $synchronizedContext.WindowLoaded.WaitOne() | Out-Null

    try {
        $i = 0
        $total = $Cleaner.Count

        foreach ($item in $Cleaner) {
            if ($synchronizedContext.IsCancellationRequested) {
                break
            }

            $i++

            if ($null -ne $synchronizedContext.UpdateCleanerRunningState) {
                & $synchronizedContext.UpdateCleanerRunningState "[$i/$total] Cleaning $($item.Title)"
            }

            Write-Host "Invoking $($item.Name)"

            Invoke-PowerShellScript -Path $item.Path
        }
    } catch {
        Write-Error "Error: $_"
    } finally {
        if ($null -ne $synchronizedContext.CloseWindow) {
            & $synchronizedContext.CloseWindow
        }
    }

    $synchronizedContext.WindowClosed.WaitOne() | Out-Null

    $powershell.Dispose()
    $runspace.Dispose()
}

function Invoke-CleanerInteractive {
    $result = Show-CleanerSelectionWindow

    if ($null -eq $result) {
        return
    }

    $selected = if ($result.Configuration.Selected) {
        $result.Configuration.Selected
    } else {
        @()
    }

    $cleaners = $result.Cleaners | Where-Object {
        if ($result.Configuration.Mode -eq 'CleanAllExcludeSelected') {
            $selected -notcontains $_.Name
        } elseif ($result.Configuration.Mode -eq 'CleanSelectedOnly') {
            $selected -contains $_.Name
        } else {
            return
        }
    }

    Show-CleanerRunningStateWindow -Cleaner $cleaners
}

function Invoke-Cleaner {
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'CleanSelectedOnly')]
        [string[]]
        $Name,

        [Parameter(Mandatory = $true, ParameterSetName = 'CleanAllExcludeSelected')]
        [switch]
        $All,

        [Parameter(ParameterSetName = 'CleanAllExcludeSelected')]
        [string[]]
        $Exclude
    )

    if ($Name) {
        $mode = 'CleanSelectedOnly'
        $selected = $Name
    } elseif ($All) {
        $selected = $Exclude
        $mode = 'CleanAllExcludeSelected'
    } else {
        return
    }

    $cleaners = Get-Cleaner | Where-Object {
        foreach ($pattern in $selected) {
            if (($_.Name -eq $pattern) -or ($_.Name -like "$pattern.*")) {
                if ($mode -eq 'CleanAllExcludeSelected') {
                    return $false
                } elseif ($mode -eq 'CleanSelectedOnly') {
                    return $true
                }
            }
        }

        if ($mode -eq 'CleanAllExcludeSelected') {
            return $true
        } elseif ($mode -eq 'CleanSelectedOnly') {
            return $false
        }
    }

    $cleaners | ForEach-Object {
        Write-Host "Invoking $($_.Name)"

        Invoke-PowerShellScript -Path $_.Path
    }
}

if ($ListAvailable) {
    Get-Cleaner | Select-Object -Property @('Title', 'Name')
} elseif ($Name) {
    Invoke-Cleaner -Name $Name
} elseif ($All) {
    Invoke-Cleaner -All -Exclude $Exclude
} elseif ($Interactive) {
    Invoke-CleanerInteractive
}
