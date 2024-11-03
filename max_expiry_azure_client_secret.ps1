$TenantID = "<your_tenant_id>"  # Azure AD tenant ID
$ClientID = "<your_client_id>"  # Application (client) ID
$ClientSecret = "<your_client_secret>"  # Azure client secret

# Convert the client secret to a secure string
$SecureAppSecret = ConvertTo-SecureString $ClientSecret -AsPlainText -Force

# Authenticate to Azure AD
$AzureAdCred = New-Object System.Management.Automation.PSCredential ($ClientID, $SecureAppSecret)

#Authenticate to Azure AD
Connect-AzureAD -TenantId $TenantID -Credential $AzureAdCred


$APPObjectID = "<object_id>" #Object id of SP for which new secret is to be created
$AppSecret ="Azure client secret"

#Get start date and define end date as 99 years from now
$StartDate = Get-Date
$EndDate = $StartDate.AddYears(99)
$AAdAppsecret = New-AzureADApplicationPasswordCredential -ObjectId $APPObjectID -StartDate $StartDate -EndDate $EndDate -CustomKeyIdentifier $AppSecret
 
#Get the Secret Set
Write-host $AAdAppsecret.Value
