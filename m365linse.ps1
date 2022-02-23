Import-Module -Name ActiveDirectory
$usr=$env:username
$grp=$env:License
#$usr="nur1"
#$grp="Business Basic"
$grp1= (Get-ADGroup "Microsoft 365 Business Basic" ).DistinguishedName
$grp2= (Get-ADGroup "Microsoft 365 Business Standard" ).DistinguishedName
$grp3= (Get-ADGroup "Enterprise Mobility Security E5" ).DistinguishedName


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
 $basic='300'
 $ulbasic=(Get-ADGroup 'Microsoft 365 Business Basic' -Properties *). Member. Count
 $avbasic= ($basic-$ulbasic)
 write-host $avbasic " M365 Business Basic License available out of "$basic

 $standard='150'
 $ulstandard=(Get-ADGroup 'Microsoft 365 Business Standard' -Properties *). Member. Count
 $avstandard= ($standard-$ulstandard)
 write-host $avstandard " M365 Business Standard License available out of"$standard


 $ems='5'
 $ulems=(Get-ADGroup 'Enterprise Mobility Security E5' -Properties *). Member. Count
 $avems= ($ems-$ulems)
 write-host $avems " Enterprise Mobility + Security E5 License available out of"$ems
