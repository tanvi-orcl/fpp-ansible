# Ansible for Databases

This ansible project allows for FPP execution for Fiserv. 

## Getting Started

## Playbook Execution

### Inventory

If running a playbook locally, edit the inventory file in this github repo. Add your FPP host and your Exadata hosts under different groups. Be sure to add in any required ssh args. Check the sample_inventory file for an example or refer to https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups for more information. 

### Variables

Required variables should be added to a file under the `vars` folder. Any new database homes or databases should get their own variable templates so that you can set the resource name as well as any optional fields such as rdbms_version or freeform_tags. These templates can be reused for additional operations such as backups or resource termination. 

Feel free to refer to sample_database.yml, sample_database_home.yml, sample_exacs.yml, and sample_exacc.yml for examples on the variable templates. There are additional optional variables in the default folders of the roles that can be overrided. 

### Running a job

1. If running a playbook locally, execute `ansible-playbook -i inventory <ansible_playbook.yml> --extra-vars "<runtime variables>"`. For example: `ansible-playbook -i inventory rdbms_create_image.yml --extra-vars "vars_file='sample_database.yml' rdbms_admin_password=WelcomeDB12##"`.

2. Runtime Variables:
    - vars_file: File with variables to be used for that playbook, located in the vars directory. Be sure to edit based on Exadata machine and workload parameters. The vars directory has already been included in the code, just have to provide the file name. 
    - hostgroup: Host group to run DB operations on. Currently only required for PDB operations or Script Copying/Execution (other playbooks are for provisioning so use localhost).
    - additional variables: Sensitive variables (such as passwords) should be only defined at runtime, not stored in a file. Check out the Playbooks below for instructions on which plays require additional variables.


## Ansible Codebase

This codebase contains a set of playbooks that can be used individually or combined into a workflow for Database Set-up. Each playbook references ansible roles (an ansible file structure used to group reusable components). Each ansible role folder contains three subdirectories - tasks, defaults, and meta. In the case of the database_scripts role, there is a fourth folder (files) to store scripts used in database set-up.

- Tasks: Contains a main.yml file that will be automatically called if the role is invoked. Also contains reusable standalone tasks.
- Defaults: Default variable values for the tasks in that role. These variables have the least precedence and will be overrided by any variables defined in the included variable file (vars_file) or in the ansible job template. Many of these variables are set as null as they are optional variables for the oci tasks and it is your choice whether to define them. For required variables, check the sample variable files or the oracle.oci ansible documentation. 
- Meta: Sets collection oracle.oci


### Playbooks

- exadata_host (fiservdb)
- fpp_host (fiservfpp)

**rdbms_create_image.yml**
- 
- Runtime Variables
    - target_node (ecc9c3n1)
    - identity_file (/home/oracle/.ssh/fiserv.key) - path to exadata key from fpp host
    - version (19.0.0.0) - to create temp home, for map file
    - dbhome_bp (APR2021) - to create temp home
    - image_name (DB1911_210420) - for map file, to register image

**rdbms_create_wc.yml**
- 
- Variables
    - target_node (ecc9c3n1)
    - identity_file (/home/oracle/.ssh/fiserv.key) - path to exadata key from fpp host
    - prexisting_home (true or false) - indicates whether to create a new home or use existing
        - if false: 
            - version (19.0.0.0) - to create new home and add wc
            - dbhome_bp (APR2021) - to create new home and add wc
        - if true: 
            - wc_name
    - image_name (DB1911_210420) - to create new home and add wc
    - cluster_name (ecc5c4) - to create new home and add wc - currently just for naming conventions
    - wc_name: OPTIONAL, if want to use a custom name or if using preexisting_home
    - osdbagrp_groups: OPTIONAL, if want to use custom groups instead of defaults

**rdbms_patch.yml**
- 
- Variables
    - hostgroup
    - db_name (a4db0_iad3zx) - to patch
    - target_node (ecc5c4n1)
    - identity_file  (/path/to/file) - for client prereqs, to move db
    - source_wc (wc_DB199_201020_legacy_ecc5c4) - for move, can't discover name from image/cluster in case multiple
    - patched_wc (wc_DB199_201020_ecc5c4) - for move, can't discover name from image/cluster in case multiple

**gi_create_image.yml**
- 
- Variables
    - target_node
    - identity_file - for client prereqs
    - grid_version (19.12.0.0.0) - to patch/upgrade grid
    - oracle_home (OPTIONAL) - provide if multiple grid homes, otherwise will use default

**gi_create_wc.yml**
- 
- Variables
    - target_node
    - identity_file - for client prereqs
    - dbhome_version, dbhome_bp - to create temp home
    - image_id, image_name - to register image

**gi_patch.yml**
- 
- Variables
    - hostgroup
    - identity_file, target_node - for client prereqs
    - dbhome_version, dbhome_bp - to create temp home
    - image_id, image_name - to register image


## Additional Resources

OCI Collection for ansible: https://oci-ansible-collection.readthedocs.io/en/stable/collections/oracle/oci/index.html



