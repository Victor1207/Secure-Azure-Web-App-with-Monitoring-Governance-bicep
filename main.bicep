@description('Azure region for all resources')
param location string = 'norwayeast'

@description('Resource group name')
param resourceGroupName string = 'rg-secure-webapp-bicep'

@description('App Service Plan name')
param appServicePlanName string = 'asp-secure-webapp-bicep'

param linuxFxVersion string = 'NODE|18-lts'


param keyVaultName string = 'kv-secure-webapp-bicep'


resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'
    tier: 'Free'
  }
  properties: {
    reserved: false
  }
}


param webAppName string = 'secure-webapp-bicep'


resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: webAppName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
    httpsOnly: true
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    enableRbacAuthorization: true
    publicNetworkAccess: 'Disabled'
  }
}
