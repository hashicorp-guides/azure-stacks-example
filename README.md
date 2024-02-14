# azure-stacks-example

_This is an example stack configuration for the private preview of Terraform Stacks. Language
constructs and features are subject to change given feedback received during this preview. Do not
use Stacks for production workloads at this time._

An example Terraform Stack that provisions a Resource Group, the networking resources for that RG, with a Linux VM that references the new Resource Group and network interface created.

Three components are used:

* `rg` uses AzureRM to create a new Resource Group and output the group name and location based on the variables defined. 
* `networking` uses AzureRM to create new networking resources based on the output of the `rg` component including a virtual network, subnet, network interface, & public IP. The component also outputs the NIC id, which is used in the `compute` component. 
* `compute` leverages the outputs from both of the `rg` and the `networking` components to create a new LinuxVM resource with a TLS private key using AzureRM.

_We do not recommend using this example within production accounts. This example will incur [small]
costs if provisioned. Please remember to destroy the infrastructure after using this example._


## Usage

_Prerequisites: You must have a Terraform Cloud account with access to the private preview of
Terraform Stacks, a GitHub account, and an Azure Subscription with Terraform Cloud configured as an OIDC
identity provider. Details of all of this are found in the provided Stacks User Guide._

1. **Configure Azure authentication** by creating a new Service Principal in the Azure portal (or with Terraform itself!) with proper permissions (Azure Blob Storage, Azure Functions, and API Management) and a trust policy to allow the role to be assumed by Terraform Cloud (the OIDC identity provider). More details on this step can be found in the Stacks User Guide or in the [Dynamic Credentials with the Azure Provider](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/dynamic-provider-credentials/azure-configuration#configure-azure) guide.
2. **Fork this repository** to your own GitHub account, such that you can edit this stack configuration
for your purposes.
3. **Edit your forked stack configuration** and change `deployments.tfdeploy.hcl` to use the Subscription ID, Client ID, and Tenant ID of the Service Principal you created, as well as an Audience value for OpenID Connect.
4. **Create a new stack** in Terraform Cloud and connect it to your forked configuration repository.
5. **Provision away!** Once applied, look at the `public_ip_address` attribute for the `azurerm_public_ip` resource in the Networking component; run a `ping` command to that ip address to verify the new VM is up and reachable. 
