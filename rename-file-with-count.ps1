$Path = "C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001\Photos"

$Files = Get-ChildItem -Path $Path -File
$Count = 1

foreach ($File in $Files) {
    $Extension = $File.Extension
    $NewName = "Photo {0:D6}{1}" -f $Count, $Extension
    Rename-Item -Path $File.FullName -NewName $NewName
    $Count++
}