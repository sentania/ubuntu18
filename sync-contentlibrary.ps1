Param(
  [string]$vSphereUSERNAME,
  [string]$vSpherePASSWORD
)

$vCenterlist = get-content inputs/vcenterlist.txt
foreach ($vcenter in $vCenterlist)
{
$cisServerConnection = Connect-CisServer -Server lab-vcf-w01-vc.lab.sentania.net -User $vSphereUSERNAME -Password $vSpherePASSWORD

$ContentLibraryService = Get-CisService com.vmware.content.library
$contentlibrarysubscribedService = Get-CisService com.vmware.content.subscribed_library
$libraryID = $ContentLibraryService.list().value #this assumes only a single content library
$contentlibrarysubscribedService.sync($libraryID)
$contentlibrarysubscribedService.sync($libraryID)

Disconnect-CisServer -Server $cisServerConnection -Confirm:$false
}
