Import-Module -Name ActiveDirectory
$usr=$env:username
$grp=$env:License
#$usr="nur1"
#$grp="Business Basic"

if ( (Get-ADUser $usr -Properties memberof).memberof -ccontains (Get-ADGroup $grp).DistinguishedName)
{
Write-Host $usr "Already exists in group" $grp

}
else
{
Add-ADGroupMember $grp -Members $usr
Write-Host  $usr "has been successfully added to" $grp
}
