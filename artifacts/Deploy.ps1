$rg = 'Arm-test111'
New-AzResourceGroup -Name $rg -Location 'Australiaeast' -Force

#What if
New-AzResourceGroupDeployment -WhatIf -Name "HubVnetDeploy" -ResourceGroupName $rg -TemplateFile .\main.json -Mode Complete

# Execution
New-AzResourceGroupDeployment -Name "HubVnetDeploy" -ResourceGroupName $rg -TemplateFile .\main.json -Verbose -Mode Complete

# Test against best practices
Import-Module C:\Users\ranab\OneDrive\Documents\ArmLinkedTemplates\arm-template-toolkit\arm-ttk\arm-ttk.psd1
Import-Module .\arm-template-toolkit\arm-ttk\arm-ttk.psm1 -Verbose
Test-AzTemplate -Templatepath .\main.json