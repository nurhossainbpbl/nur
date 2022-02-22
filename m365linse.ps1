Import-Module -Name ActiveDirectory
$usr=$env:username
$grp=$env:License
#$usr="nur1"
#$grp="Business Basic"
$grp1= (Get-ADGroup "Business Standard" ).DistinguishedName
$grp2= (Get-ADGroup "Business Basic" ).DistinguishedName
$grp3= (Get-ADGroup "EMS" ).DistinguishedName


if ( (Get-ADUser $usr -Properties memberof).memberof -ccontains (Get-ADGroup $grp).DistinguishedName)
{
   Write-Host $usr "Already exists in group" $grp

   }
    else
        {
         if ( (Get-ADUser $usr -Properties memberof).memberof -ccontains (Get-ADGroup $grp1).DistinguishedName)
          {
           Write-Host $usr "Already exists in group" $grp1
           }
           else
                {
                if ( (Get-ADUser $usr -Properties memberof).memberof -ccontains (Get-ADGroup $grp2).DistinguishedName)
                    {
                       Write-Host $usr "Already exists in group" $grp2
                     }
                     else
                     {
                     if ( (Get-ADUser $usr -Properties memberof).memberof -ccontains (Get-ADGroup $grp3).DistinguishedName)
                         {
                            Write-Host $usr "Already exists in group" $grp3

                     }
                     else {
                     Add-ADGroupMember $grp -Members $usr
                     Write-Host  $usr "has been successfully added to" $grp
                     }
                }
            }
     }
 Write-host "License Summary Report"
 $plicese='300'
 $ulicense=(Get-ADGroup 'Business Basic' -Properties *). Member. Count
 $availableLicense= ($plicese-$ulicense)
 write-host $availableLicense "License available out of 300"
