# Ansible for Databases

This ansible project allows for FPP execution for Fiserv. 

## Getting Started

### Using Ansible with OCI

Follow the instructions on this documentation to make sure you are set-up to use ansible with the OCI modules. Be sure to create the OCI Config file: https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/ansiblegetstarted.htm.

## Playbook Execution

### Inventory

If running a playbook locally, edit the inventory file in this github repo. Add your different Exadata hosts under different groups. Be sure to add in any required ssh args. Check the sample_inventory file for an example or refer to https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups for more information. 

If running a playbook from rundeck, import the hosts. 

### Variables

Required variables should be added to a file under the `vars` folder. Any new database homes or databases should get their own variable templates so that you can set the resource name as well as any optional fields such as rdbms_version or freeform_tags. These templates can be reused for additional operations such as backups or resource termination. 

Feel free to refer to sample_database.yml, sample_database_home.yml, sample_exacs.yml, and sample_exacc.yml for examples on the variable templates. There are additional optional variables in the default folders of the roles that can be overrided. 

### Running a job

1. If running a playbook locally, execute `ansible-playbook -i inventory <ansible_playbook.yml> --extra-vars "<runtime variables>"`. For example: `ansible-playbook -i inventory rdbms_create.yml --extra-vars "vars_file='sample_database.yml' rdbms_admin_password=WelcomeDB12##"`.

2. Runtime Variables:
    - vars_file: File with variables to be used for that playbook, located in the vars directory. Be sure to edit based on Exadata machine and workload parameters. The vars directory has already been included in the code, just have to provide the file name. 
    - hostgroup: Host group to run DB operations on. Currently only required for PDB operations or Script Copying/Execution (other playbooks are for provisioning so use localhost).
    - additional variables: Sensitive variables (such as passwords) should be only defined at runtime, not stored in a file. Check out the Playbooks below for instructions on which plays require additional variables.

### Creating a Workflow

Creating a workflow instead of running an individual job allows you to automate a longer process. For example, linking together DB Home Set-Up + Database Set-Up + Scripting. These playbooks are individual since as a user, you might often want to set-up just a database on an existing home, but you might want to automate the initial creation.


## Ansible Codebase

This codebase contains a set of playbooks that can be used individually or combined into a workflow for Database Set-up. Each playbook references ansible roles (an ansible file structure used to group reusable components). Each ansible role folder contains three subdirectories - tasks, defaults, and meta. In the case of the database_scripts role, there is a fourth folder (files) to store scripts used in database set-up.

- Tasks: Contains a main.yml file that will be automatically called if the role is invoked. Also contains reusable standalone tasks.
- Defaults: Default variable values for the tasks in that role. These variables have the least precedence and will be overrided by any variables defined in the included variable file (vars_file) or in the ansible job template. Many of these variables are set as null as they are optional variables for the oci tasks and it is your choice whether to define them. For required variables, check the sample variable files or the oracle.oci ansible documentation. 
- Meta: Sets collection oracle.oci


### Playbooks

**basic_test.yml**
- Tests if your ansible environment has been set-up correctly. If running from localhost, pulls network services information to check if your OCI credentials are working and pulls compartment information to check if your variable file was defined. If running from a host, runs a simple shell command to make sure the inventory has been set-up correctly.
- Variables
    - vars_file
        - compartment_id
    - hostgroup (localhost or the name of a group from your inventory)

**rdbms_create.yml**
- Creates a new database. Assumes that the database home has already been created.
- Variables
    - vars_file
        - CDBname
        - workload_tag (optional prefix)
        - auto_backup_window
        - recovery_window_in_days
        - rdbms_home_name or rdbms_home_id (note: if using rdbms_home_name, include vm cluster information for discovery)
        - compartment_id
    - rdbms_admin_password

**rdbms_home_create.yml**
- Creates a new database home. Assumes that the VM cluster has already been created.
- Variables
    - vars_file
        - rdbms_home_name
        - workload_tag (optional prefix)
        - rdbms_version
        - vm_cluster_name or vm_cluster_id (note: if using vm_cluster_name, include exadata information for discovery)
        - exadata_type ('exacs' or 'exacc')
        - compartment_id

**rdbms_terminate.yml**
- Terminates a database.
- Variables
    - vars_file
        - CDBname
        - workload_tag (optional prefix)
        - rdbms_home_name or rdbms_home_id (note: if using rdbms_home_name, include vm cluster information for discovery)
        - compartment_id

**rdbms_home_terminate.yml**
- Terminates a database home.
- Variables
    - vars_file
        - rdbms_home_name
        - workload_tag (optional prefix)
        - vm_cluster_name or vm_cluster_id (note: if using vm_cluster_name, include exadata information for discovery)
        - exadata_type ('exacs' or 'exacc')
        - compartment_id

**rdbms_backup.yml**
- Creates a standlone backup for ExaCS. Creates a backup destination (if backup_destination_id is not provided and adds backup destination to DB for ExaCC.
- Variables
    - vars_file
        - CDBname/workload_tag or database_id (note: if using CDBname, include db home information / compartment id for discovery)
        - exadata_type ('exacs' or 'exacc')
        - If exacc, additional values based on backup destination type (check sample_exacc.yml)

**rdbms_setup_script.yml**
- Unarchives newdb zip file and runs DB setup scripts.
- Variables
    - vars_file
    - hostgroup

**prdbms_create.yml**
- Creates a new pdb. Assumes that the database has already been created.
- Variables
    - vars_file
        - PDBname
        - CDBname
        - workload_tag (optional prefix)
        - rdbms_home_name or rdbms_home_id (note: if using rdbms_home_name, include vm cluster information for discovery)
        - compartment_id
        - oracle_sid
    - hostgroup
    - prdbms_admin_password
    - rdbms_wallet_password

**prdbms_delete.yml**
- Deletes the pdb on an existing database.
- Variables
    - vars_file
        - PDBname
        - CDBname
        - workload_tag (optional prefix)
        - rdbms_home_name or rdbms_home_id (note: if using rdbms_home_name, include vm cluster information for discovery)
        - compartment_id
    - hostgroup

## Additional Resources

OCI Collection for ansible: https://oci-ansible-collection.readthedocs.io/en/stable/collections/oracle/oci/index.html



