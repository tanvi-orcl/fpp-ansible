# Ansible for FPP

This ansible project allows for Fleet Patching and Provisioning automation. 

## Playbook Execution

### Inventory

If running a playbook locally, edit the inventory file in this github repo. Add your FPP host and your Exadata hosts. Be sure to add in any required ssh args. Check the sample_inventory file for an example or refer to https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#inventory-basics-formats-hosts-and-groups for more information. 


## Ansible Codebase

This codebase contains a set of playbooks used to automate FPP operations. The playbooks reference ansible roles (an ansible file structure used to group reusable components), where the majority of work takes place. 

### Roles

**grid_fpp.yml**, **rdbms_fpp.yml**
The grid_fpp and rdbms_fpp roles perform grid/rdbms specific fpp operations. The playbooks call tasks within these roles, and then these roles call helper functions in the same role and in the common roles.

**fpp_common.yml**, **target_common.yml**, **oci_common.yml**
The common roles run any tasks that must be performed on a specific host, such a shell scripts and file creations. If the role is being called, the assumption is that ansible is already operating on the correct host; any delegation happens in the actual playbooks, grid_fpp tasks, or rdbms_fpp tasks. The fpp_common runs on the fpp host, target_common on the exadata hosts, and oci_common on the localhost.


### Playbooks

General Variables
- fpp_host (n3db1) - should be the specific host and not a group encompassing the host
- identity_file (/home/oracle/.ssh/idrsa.key) - path to exadata key from fpp host

**rdbms_create_image.yml**
- 
- Runtime Variables
    - exa_host (ecc9n1)
    - exadata_type (exacc or exacs)
    - version (19.0.0.0) - to create temp home, for map file
    - version_tag (19.13.0.0.0) - to create temp home
    - OPTIONAL: image_name (DB1911_210420)

**rdbms_create_wc_new.yml**
- 
- Runtime Variables
    - exa_group (exadb)
    - image_name (DB1911_210420) - to create new home and add wc
    - version (19.0.0.0) - to create new home and add wc
    - version_tag (19.13.0.0.0) - to create new home and add wc
    - OPTIONAL: db_home_name, osdbagrp_groups

**rdbms_create_wc_existing.yml**
- 
- Runtime Variables
    - exa_group (fiservdb)
    - image_name (DB1911_210420) - to create new home and add wc
    - db_home_name (current dbhome name)
    - OPTIONAL: osdbagrp_groups

**rdbms_patch.yml**
- 
- Runtime Variables 
    - exa_host (ecc9n1)
    - source_home (dbhome1_191200)
    - dest_home (dbhome1_191300)
    - db_unique_name (a4db0_iad3zx) - to patch
    - OPTIONAL: patch_error_param (-revert, -continue)
    - OPTIONAL: ignorewcpatches_param (-ignorewcpatches)
    - OPTIONAL: forcerolling_param (-forcerolling)

**rdbms_delete_wc.yml**
- 
- Runtime Variables
    - exa_group (ecc9n1)
    - exadata_type (exacc or exacs)
    - db_home_name (db_home_name to delete)
    - OPTIONAL: orphan_home

**gi_create_image.yml**
- ASSUMES THAT GI HOME ALREADY PATCHED / AT IMAGE THEY WOULD LIKE TO ZIP
- Runtime Variables 
    - exa_host (ecc9n1)
    - container_url
        - OPTIONAL: curl_https_proxy
    - version (19.0.0.0) - for map file
    - version_tag (19.13.0.0.0) - to patch/upgrade grid and for map file
    - OPTIONAL: image_name (DB1911_210420)

**gi_create_wc_new.yml**
- 
- Runtime Variables
    - container_url
        - OPTIONAL: curl_https_proxy
    - image_name (GI1911_210420) - to create new home and add wc
    - OPTIONAL: wc_name, gi_home_suffix

**gi_create_wc_existing.yml**
- 
- Runtime Variables
    - image_name (GI1911_210420) - to create new home and add wc
    - gi_home_path

**gi_patch.yml**
- 
- Runtime Variables
    - source_wc
    - dest_wc
    - batch_list
    - OPTIONAL: patch_error_param (-revert, -continue)
    - OPTIONAL: ignorewcpatches_param (-ignorewcpatches)
    - OPTIONAL: forcerolling_param (-forcerolling)

**rdbms_delete_image.yml**
- 
- Runtime Variables
    - image_name (DB1911_210420)

## Additional Resources

OCI Collection for ansible: https://oci-ansible-collection.readthedocs.io/en/stable/collections/oracle/oci/index.html



