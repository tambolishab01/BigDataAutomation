Login-AzureRmAccount
Select-AzureRmSubscription -Subscription "07494aa9-3134-4cdd-9e14-e0d21257696c"
New-AzureRmResourceGroupDeployment -Name bigdatadeployment -ResourceGroupName bigdatademoRG -TemplateUri "https://raw.githubusercontent.com/tambolishab01/BigData/master/Main_Template1.json"