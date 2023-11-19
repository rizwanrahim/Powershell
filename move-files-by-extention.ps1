$sourcePath  = 'C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001'
$destination = 'C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001\Photos'

# if the destination folder does not already exist, create it
# if (!(Test-Path -Path $destination -PathType Container)) {
#     $null = New-Item -Path $destination -ItemType Directory
# }


Get-ChildItem -Path $sourcePath -Filter '*.jpg' -File -Recurse | ForEach-Object {
    $newName = '{0}_{1}_{2}' -f $_.Directory.Parent.Name, $_.Directory.Name, $_.Name
    $_ | Move-Item -Destination (Join-Path -Path $destination -ChildPath $newName)
}
