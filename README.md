# BigDataAutomation

Index:
------

1.  [*Objective*](#objective)

2.  [*Diagram*](#diagram)

3.  [*Predeploy Steps*](#predeploy-steps)

4.  [*Deployment Steps*](#deployment-steps)


**Objective**
-------------

To provision big data infrastructure on Azure by deploying required services using script (IaaC).

**Diagram**
------------

[*Click for the diagram*](https://github.com/alankarmehta/BigDataAutomation/tree/master/BigDataBatch.JPG)

**Predeploy Steps**
-------------------

- Provision on-premise [*SQL Server*](https://github.com/alankarmehta/BigDataAutomation/tree/master/predeploy/SqlServer) with SQL DB and this sever will also act has source for CSV files
    - This source data from the server will be ingested to the Azure Blob for processing
    - note: For demo purpose we have setup the SQL Server on Azure cloud

- Deploying VM with [*Ansible Tower*](https://github.com/alankarmehta/BigDataAutomation/tree/master/predeploy/AnsibleTower)
    - Generate public and private ssh key using puttygen.exe
    - Deploy Ansible Tower deployansibletower.json
            
         - Ensure the linked template file (ansibletowervm.json) and Ansible Tower installation script (installansibletowerscript.sh) are in same folder
         - Specify the folder path in the deployansibletower.json for parameter _artifactsLocation
         - Provide the public key to the  parameter sshKeyData
         - Remember the Ansible tower username and admin password provided

    - Test installed Ansible Tower
         
         - Connect to Linux VM using ssh (private key first time)
         - Login using the Ansible tower user name provided during script execution
    
    - Install Azure CLI with yum, for [*detail steps*](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-yum?view=azure-cli-latest)
            
- Provisioning [*Key Vault*](https://github.com/alankarmehta/BigDataAutomation/tree/master/predeploy/KeyVault) and storing secrets such as
    - username
    - password
    - connection string to on-premise sql db

- Ansible Tower Configuration
    - open ansible tower using Ansible VM public IP on browser https://(publicip)
    - Login with 'admin' user and the admin password provided during installation
    - Provide the Licence (first time)
    - Credentials option:
         
         - create credential for git repo
         - create credential for azure
    - Project: create project connecting to already created git credentials
    - Create [*playbook*](https://github.com/alankarmehta/BigDataAutomation/blob/master/deployarm.yml) script which will have tasks to fetch secret keys and execute [*arm template*](https://github.com/alankarmehta/BigDataAutomation/blob/master/Main_Template1.json)
    - Open template option, configure playbook yaml file name (deployarm.yml) and select azure credential with job type Run

**Deployment Steps**
------------------------

- Deploying using Ansible Tower
    - Login in to Ansible Tower using Ansible VM public IP on browser https://(publicip)
    - Click on Template option
    - Click on 'Start a job using this template' option on appropiate template
