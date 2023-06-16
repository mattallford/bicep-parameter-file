@description('Optional. Enter the code for the environment being deployed.')
@allowed([
  'dev'
  'test'
  'prod'
])
param environmentCode string = 'dev'

@description('Required. Provide the location to deploy the environment to.')
@allowed([
  'australiaeast'
  'southeastasia'
  'eastus2'
])
param location string

@description('Optional. Provide the tags to be applied to the resources.')
param tags object = {}

@description('Required. Determines whether or not a storage account is deployed')
param deployStorage bool

param storageAccountName string

// Set a unique string for the storage account name
// var storageAccountName = 'st${uniqueString(subscription().id)}'

targetScope = 'subscription'

module primaryResourceGroup 'modules/resourcegroup/resourcegroup.bicep' = {
  name: 'rg-${environmentCode}-001'
  params: {
    location: location
    resourceGroupName: 'rg-${environmentCode}-001'
    tags: tags
  }
}

module storageAccount 'modules/storageAccount/storageaccount.bicep' = if (deployStorage) {
  scope: resourceGroup(primaryResourceGroup.name)
  name: storageAccountName
  params: {
    location: location
    storageAccountName: storageAccountName
    tags: tags
  }
}
