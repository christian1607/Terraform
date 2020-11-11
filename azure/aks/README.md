Es necesario crear un service principal

az ad sp create-for-rbac --name ServicePrincipalName

Esto nos creara nuestro client-id y el secret que seran usado en la opcion de service_principal de aks 