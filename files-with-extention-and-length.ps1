$Path = 'C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001\Videos'
$LengthColumn = 27
$Shell = New-Object -ComObject Shell.Application
$Files = Get-ChildItem -Path $Path -Recurse -File
foreach ($File in $Files) {
    $ShellFile = $Shell.Namespace($File.DirectoryName).ParseName($File.Name)
    $LengthString = $Shell.Namespace($File.DirectoryName).GetDetailsOf($ShellFile, $LengthColumn)
    $Length = [timespan]::ParseExact($LengthString, "h\:mm\:ss", $null)
    if ($Length -gt [timespan]::FromMinutes(2)) {
        Write-Host "$($File.FullName) - $($LengthString)"
    }
}
