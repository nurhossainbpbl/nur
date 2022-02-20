Import-Module -Name ActiveDirectory
$username=$env:username
$grpname=$env:License


if (Add-ADGroupMember  $grpname -Members $username){

Write-Host 'user added'

}

