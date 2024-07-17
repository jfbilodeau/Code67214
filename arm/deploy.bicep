param webAppName string = 'myWebApp' // Name of the web app
param location string = 'Canada East' // Location for all resources
param skuName string = 'F1' // SKU for the App Service Plan (Free tier)

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: '${webAppName}-plan'
  location: location
  sku: {
    name: skuName
    tier: 'Free'
  }
  properties: {
    reserved: false
  }
}

resource webApp 'Microsoft.Web/sites@2021-01-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}
