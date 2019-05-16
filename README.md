# BigDataAutomation

Index:
------

1.  [*Objective*](#objective)

2.  [*Diagram*](#diagram)

3.  [*Predeploy Steps*](#predeploy-steps)

4.  [*Technical assistance*](#technical-assistance)

5.  [*Performance measurement*](#performance-measurement)

6.  [*Handling advanced TechOps*](#handling-advanced-techops)

7.  [*Materials*](#materials)

8.  [*Bootcamp schedule*](#bootcamp-schedule)

9.  Learning:

    1.  [*Pre-bootcamp: Github basic usage*](#pre-bootcamp-github-basic-usage)

    2.  [*Introduction to AWS Cloud*](#aws-cloud)

    3.  [*Demo : Putting it all together, final exercise.*](#putting-it-all-together-final-exercise.)

**Objective**
-------------

To provision big data infrastructure on Azure by deploying required services using script (IaaC).

**Diagram**
---------------------

Link to the diagram

**Predeploy Steps**
------------
- Set up on-premise SQL Server with SQL DB
- Deploying VM with Ansible Tower
    - Generate public and private ssh key using puttygen.exe
    - Deploy deployansibletower.json
          - Ensure the linked template file (ansibletowervm.json) and Ansible Tower installation script (installansibletowerscript.sh) are in same folder
          - Specify the folder path in the deployansibletower.json for parameter _artifactsLocation
          - Provide the public key to the  parameter sshKeyData
          - Note down the Ansible tower user name provided

    - Test installed Ansible Tower
          - Connect to Linux VM using ssh (private key first time)
          - Login using the Ansible tower user name provided during script execution
    
    - Install Azure CLI with yum, detail steps in below URL
            https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-yum?view=azure-cli-latest

- Provisioning Key Vault and storing secrets such as
    - username
    - password
    - connection string to on-premise sql db

- Ansible Tower Configuration
        - open ansible tower using https://publicip (Ansible VM public IP) on browser
        - Login with 'admin' user and the password provided during installation
        - Provide the Licence (first time)
        - Credentials option:
              - create credential for git
              - create credential for azure
        - Project: create project connecting to already created git credentials
        - Create deployarm.yml script which will have tasks to fetch secret keys and execute arm template (Main_Template1.json)
        - Open template option, configure yaml file name (deployarm.yml) and select azure credential
        


**Technical assistance**
------------------------

You can contact other Bootcamp participants or any available tutor if you need technical assistance. 

You can connect them on HangOut or SLACK channel created for bootcamp. Note that candidates have to reach out to instructor in case of issues/clarifications to complete their assignments on time. Delivering assignments to tutor's expectation is candidate's responsibility.

**Performance Measurement**
---------------------------

1.  Code review after each practice.
    --------------------------------

2.  Checkpoint completion after Learning stage with your assigned tutor.
    --------------------------------------------------------------------

**Handling advanced TechOps**
-----------------------------

People that move faster than average can complete the exercises at their own pace and send them earlier.

**Materials**
-------------

You will need a headset, for hangouts calls. 

**Bootcamp schedule**
---------------------

This bootcamp is divided into two weeks, dedicated for mostly reading the material indicated. There is an exercise at the end of each week, which is required to be sent by the end of each week’s Friday. Assignment is considered to be completed only after instructor confirmation, so plan for review and rework as well. If you can’t reach the deadline, contact your tutor and request an extension.

**Extra reading material**
--------------------------

If you would like to keep reading after finishing this bootcamp, there's an extensive community maintained library with lots of books, that can be found here:
[*Free books*](https://github.com/ber5ien/Free-DevOps-Books-1/tree/master/book)

***Pre-bootcamp: Github basic usage***
--------------------------------------

Previous to engaging our AWS bootcamp, you need to understand the basics of Github, the most widely used [*version control software*](https://en.wikipedia.org/wiki/Version_control). It’s an integral part of every Information Systems professional team.

-   [*Online Git course*](https://try.github.io/levels/1/challenges/1)

-   [*Github specific course*](https://guides.github.com/activities/hello-world/)

-   [*Git course notes*](https://github.com/globant-ui-rosario/git-course) - what to focus on, to get ahead on this bootcamp.

***AWS Cloud***
----------------

The first week is dedicated to understand AWS product, solutions and working methods..

-   [*About AWS*](https://aws.amazon.com/) 

-  Documentation : [*AWS Documents*](https://docs.aws.amazon.com/#lang/en_us)

-   AWS Partner Network [*'APN Portal'*](https://aws.amazon.com/partners/apn-portal/)

**Exercise:**

Complete the [*AWS exercise*](https://github.com/alankarmehta/AWSbootcamp/blob/master/Bootcamp%20AWS.pdf) and follow the instructions mentioned in the document.

***Notes:***

-   All script should be error free 

-   It should run as it if some download and run that. All dependancies related to assignment question should be handle in the shell script file

-   There should be comment and proper indetendation 


***Demo: Putting it all together, final exercise.***
------------------------------------------------------

We want you to create a share git repository and show each and every assignment running on new machine

-   Keep all of your dependancy files with assignment so that it should run anyware 

-   Script should show proper debug result so that it should give proper idea about what script is executiong e.g. comment and required outout. 

-   Output of executed script should be kept in a log file and that sould be uploaded to GitHub 
