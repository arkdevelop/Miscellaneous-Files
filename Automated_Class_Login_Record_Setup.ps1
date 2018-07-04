$File = "Automated_Class_Login_Record.exe"

Write-Output "Searching for $File"
$FilePath = Get-ChildItem -Filter $File -Recurse -ErrorAction SilentlyContinue -Force | % { $_.FullName } | Select-Object -First 1

if ($FilePath -ne $null) {
    if (Test-Path $FilePath) {
        Write-Output "$File found at: $FilePath"
        Write-Output "Setting program schedule"
        SchTasks /Create /SC WEEKLY /D TUE,THU /TN "Automated Class Recording" /TR "$FilePath" /ST 11:30
    }
    else {
        Write-Warning "Error: Could not find $File"
    }
}
else {
    Write-Warning "Error: Could not find $File"
}
