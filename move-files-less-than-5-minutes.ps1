$SourceFolder = "C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001\Videos"
$DestinationFolder = "C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001\Reels"

# if the destination folder does not already exist, create it
if (!(Test-Path -Path $DestinationFolder -PathType Container)) {
    $null = New-Item -Path $DestinationFolder -ItemType Directory
}


$LengthColumn = 27
$Shell = New-Object -ComObject Shell.Application
$Files = Get-ChildItem -Path $SourceFolder -Recurse -File
foreach ($File in $Files) {
    $ShellFile = $Shell.Namespace($File.DirectoryName).ParseName($File.Name)
    $LengthString = $Shell.Namespace($File.DirectoryName).GetDetailsOf($ShellFile, $LengthColumn)
    $Length = [timespan]::ParseExact($LengthString, "h\:mm\:ss", $null)
    if ($Length -lt [timespan]::FromMinutes(5)) {
        Move-Item -Path $File.FullName -Destination $DestinationFolder -Force
    }
}
