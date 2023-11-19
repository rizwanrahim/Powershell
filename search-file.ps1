$filename = '*file_name*.*'#you can use wildcards here for name and for extension
$searchinfolder = 'C:\Users\Rizwa\Documents\takeout-20231118T173738Z-001\Videos'
Get-ChildItem -Path $searchinfolder -Filter $filename -Recurse | %{$_.FullName}