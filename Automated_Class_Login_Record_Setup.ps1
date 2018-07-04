$FilePath = Get-ChildItem -Filter Automated_Class_Login_Record.py -Recurse -ErrorAction SilentlyContinue -Force | % { $_.FullName } | Select-Object -First 1
Write-Output "File Found at: $FilePath"
SchTasks /Create /SC WEEKLY /D TUE,THU /TN "Class Recording" /TR "$FilePath" /ST 11:30