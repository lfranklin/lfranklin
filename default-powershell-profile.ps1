##############################################
##  Transcript = Save-Transcript TO Use = Start-Transcript -Append
###############################################

Function Save-Transcript {
$global:TRANSCRIPT = "C:\Logging\PowerShell\ISE\Transcript\PSLOG_{0:dd-MM-yyyy}.txt" -f (Get-Date)
Start-Transcript -Append
}
Save-Transcript


##############################################
##  function Get-CmdletAlias
###############################################

function Get-CmdletAlias ($cmdletName) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletName"} |
      Format-Table -Property Definition, Name -AutoSize
}
###############################################
##  Projects - List all GCP Projects
###############################################
Function Projects {
Get-GcpProject | ? {($_.Name -like '*') -and $_.lifecyclestate -eq "ACTIVE"} | Select Name | Sort-Object Name
}

###############################################
## List all GCP Projects
###############################################

Function all-projects {
	gcloud projects list --format="table[box,title='Zebra Project List'](name:sort=1,projectId:label=ProjectID,labels.bu-owner-manager:label=BUManager,labels.bu-owner-technical:label=BUTechnical,labels.cost-center:label=CostCenter,labels.business-unit:label=BU,labels.project-or-product:label=ProjectProduct,labels.tier:label=Tier,labels.organization:label=Organization)"
}

###############################################
## List GCP Orgs
###############################################

Function orgs{
	gcloud organizations list
}

###############################################
## List first level GCP Folders in zebra.com org
###############################################

Function list-folders {
	gcloud resource-manager folders list --organization=463373134989
}

###############################################
##  gcloud to list all projects
###############################################
function all-projects{
gcloud projects list --format="table[box,title='Zebra Production Project List'](name:sort=1,projectId:label=ProjectID,labels.bu-owner-manager:label=BUManager,labels.bu-owner-technical:label=BUTechnical,labels.cost-center:label=CostCenter,labels.project-or-product:label=ProjectProduct,labels.tier:label=Tier,labels.orginization:label=Orginization)"
}


