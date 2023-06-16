using './deploy-environment.bicep'

param environmentCode = 'dev'
param location = 'australiaeast'
param tags = {
  environment: environmentCode
  deployedWith: 'IaC'
}
param deployStorage = environmentCode == 'dev' ? false : true
param storageAccountName = 'st${uniqueString('myuniquestring')}'

