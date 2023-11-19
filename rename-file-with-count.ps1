$Path = "C:\Users\Rizwa\Documents\VHD\To Be Numbered"

$Files = Get-ChildItem -Path $Path -File
$Count = 32221

foreach ($File in $Files) {
    $Extension = $File.Extension
    $NewName = "Photo {0:D6}{1}" -f $Count, $Extension
    Rename-Item -Path $File.FullName -NewName $NewName
    $Count++
}