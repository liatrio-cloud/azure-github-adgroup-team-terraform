terraform {
  backend "azurerm" {
    storage_account_name = "[AZURE_STORAGE_ACCOUNT]"
    resource_group_name  = "[AZURE_RESOUCE_GROUP]"
    container_name       = "[TERRAFORM_STATE_CONTAINER_NAME]"
    key                  = "[TERRAFORM_STATE_FILE_KEY]"
  }
}