@description('Required. Enter the name of the Resource Group.')
param resourceGroupName string

@description('Required. Provide the location to deploy the resource group to.')
@allowed([
  'australiaeast'
  'southeastasia'
  'eastus2'
])
param location string

@description('Optional. Provide the tags to be applied to the resource group.')
param tags object = {}

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}
