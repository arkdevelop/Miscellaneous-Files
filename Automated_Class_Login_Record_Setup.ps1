$File = "Automated_Class_Login_Record.exe"
$CouldNotFindFileError = "Error: Could not find $File `nPlease ensure you have the file downloaded, then if need be, contact the script developer."

Write-Output "Searching for $File"
$FilePath = Get-ChildItem -Filter $File -Recurse -ErrorAction SilentlyContinue -Force | % { $_.FullName } | Select-Object -First 1

if ($FilePath -ne $null) {
    if (Test-Path $FilePath) {
        Write-Output "$File found at: $FilePath"
        Write-Output "Setting program schedule"
        SchTasks /Create /SC WEEKLY /D TUE,THU /TN "Automated Class Recording" /TR "$FilePath" /ST 11:30
        Write-Output "Successfully setup $File"
    }
    else {
        throw "$CouldNotFindFileError"
    }
}
else {
    throw "$CouldNotFindFileError"
}
