targetScope = 'subscription'

@description('Policy name')
param policyName string = 'deny-public-app-service-access'

@description('Policy display name')
param displayName string = 'Deny Public App Service Public Network Access'

resource denyPublicAccessPolicy 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: policyName
  properties: {
    displayName: displayName
    policyType: 'Custom'
    mode: 'All'
    description: 'Denies App Services that allow public network access'
    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Web/sites'
          }
          {
            field: 'Microsoft.Web/sites/publicNetworkAccess'
            equals: 'Enabled'
          }
        ]
      }
      then: {
        effect: 'deny'
      }
    }
  }
}
