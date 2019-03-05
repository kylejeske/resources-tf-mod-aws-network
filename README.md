# Note
Typically, you can find most modules at https://registry.terraform.io/

Re-use these as much as you can, unless you find a use-case where you need to build your own.

>This has been deployed public for the betterment of the community. 
>
>However, if you plan to include this, clone it into your own code repository first. 
>
>No guarantees explicit or otherwise implicit, have been made that this will continue to be available to the public.



## Git-Repo > resources-tf-mod-aws-network
TerraForm Network Module for AWS network creation

#### TF Module Name
awsNetworkModule

#### Description
This is a module to be included in a terraform project. 

It describes the network architecture of the infrastructure within AWS that it is building.

Currently, it has the capabilities of: 
* Create a VPC with private and public subnets
    * CIDR Block: 10.0.0.0/16
    * Subnet 1: 10.10.0.1/24
    * Subnet 2: 10.20.0.1/24
* Create an Internet Gateway
* Create a routing table
    * Add a rule that allows public traffic (0.0.0.0/0) into subnet 1.
* Create a AWS Key Pair (ec2 public key)
    * from Variable: 'public_key_path'

#### File Structure:
>
    1) README.md (this file)
    2) variables.tf
    3) output.tf
    4) providers.tf
    5) resources.tf

### Reasoning
Re-useable code.

By segmenting code into independent code repositories, they are less likely to be modified directly and may be included in other projects.

### Usage
* Including it in your Terraform project:

> Edit the Variables file in your local project (not this module):

    ## local development >> Variables.tf ::

    variable "tf-git-repo" {
        description = "The location of your github repo (http://github.com/[your-git-repo]/...repo-name?ref=[x.x.x])"
        default = "[[ your-git-repo ]]"
    }

> Edit the Terraform file in your local project (not this module):

    ## local development >> Terraform.tf ::

    module "awsNetworkModule" {
        source = "git::ssh://github.com/${var.tf-git-repo}/resources-tf-aws-network-module?ref=v1.0.0"
    }


### Example

If my github code repository was located at:
>htttp://github.com/company-git/tf-module-1
>

#### Variables.tf:

    variable "tf-git-repo" {
        description = "The location of your github repo (http://github.com/[your-git-repo]/...repo-name?ref=[x.x.x])"
        default = "company-git"
    }

#### Terraform.tf:

    module "awsNetworkModule" {
        source = "git::ssh://github.com/${var.tf-git-repo}/resources-tf-aws-network-module?ref=v1.0.0"
    }