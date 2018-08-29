Import-Module ActiveDirectory

$Users = Import-Csv -Delimiter "," -Path "PATH_OF_CSV"

foreach ($User in $Users) {
    $Displayname = $User.Firstname + " " + $User.Lastname
    $UserFirstname = $User.Firstname
    $User.Lastname = $User.Lastname
    $OU = "$User.OU"
    $SAM = $User.SAM
    $UPN = $User.Firstname + "." + $User.Lastname + "@" + $User.Maildomain
    $Password = $User.Password
    New-ADUser -Name "$Displayname" -DisplayName "$Displayname" -SamAccountName $SAM -UserPrincipalName $UPN -GivenName "$UserFirstname" -Surname "$UserLastname" -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$OU" -ChangePasswordAtLogon $false -PasswordNeverExpires $true -server domain
}
