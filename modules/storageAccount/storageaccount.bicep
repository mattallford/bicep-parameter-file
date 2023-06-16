@description('Required. Enter the name of the storage account.')
param storageAccountName string

@description('Required. Provide the location to deploy the resource to.')
@allowed([
  'australiaeast'
  'southeastasia'
  'eastus2'
])
param location string

@description('Optional. Provide the tags to be applied to the resource.')
param tags object = {}

resource storageaccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  tags: tags
  sku: {
    name: 'Standard_LRS'
  }
}
