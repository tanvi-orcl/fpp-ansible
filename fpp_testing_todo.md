Testing Done 12/4
- rdbms_create_image (DBtst1_191300)
    - forgetting parameters
    - existing image
    - incorrect version_tag
    - success
Testing Done 12/5
- rdbms_create_wc_new (DBtst1_191300, wc_dbhometst1_191300_ecc9c3)
    - forgetting parameters
    - image does not exist
    - existing db_home
    - existing wc
    - success
- rdbms_create_wc_new (DBtst1_191300, wc_dbhometst1_191300_ecc9c3)
    - forgetting parameters
    - image does not exist
    - not existing db_home
    - not existing wc
    - success
- rdbms_patchdb (dbhome3_191300 --> dbhometst1_191300)
    - forgetting parameters
    - db does not exist
    - source_wc does not exist
    - dest_wc does not exist
    - incorrect ignorewcpatches_param / forcerolling_param

TO DO (Broke Environment)
    - continue (dbhome3_191300 --> dbhometst1_191300)
    - ignorewcpatches_param + forcerolling_param
    - revert
    - run again as is (dbhometst1_191300 --> dbhometst2_191300)



TO DO
- TEST
    - multiple hosts in one group (where possible)
    - pre-gihome script
        - Note: set correct permissions / owner for action script
- do more greps when ONLY parsing outputs of a shell command a single time
- check if variables are defined correctly / exist
- figure out a better way to select only the current batch / first node to run
- do proper clean-up on failures
- debug messages: one line where possible, var where needed, and not repetitive
- setting vars vs. passing vars
- Clean Up
    - task names / comments
    - README
    - set assert name + quiet

Full Test
- gi_create_image
    - Fail Case --> Same Image Name
- gi_create_wc
    - new (with and without path)
    - existing (curr and not curr home)
    - Fail Case --> Not existing Image
    - Fail Case --> oh_dirname already exists
- gi_patch
    - continue
    - revert
    - Fail Case --> Source not WC, Dest not WC
    - Fail Case --> incorrectly defined flags
- rdbms_create_wc
    - new
    - existing
- rdbms_patch
    - continue
    - revert
    - Fail Case --> Source not WC, Dest not WC
    - Fail Case --> DB Unique Name does not exist
    - Fail Case --> incorrectly defined flags
- delete_image
- rdbms_delete_wc
    - wc + home
    - orphan home
- gi_delete_wc

Finalize with Fiserv
- max_fail_percentage / failure behavior
- naming standards
    - wc_name using "cluster name" instead of client_name
- any_error_fatal?
    - gihome prereqs?
- Out of Scope
    - automating Post tasks --> not working with UA because won't move to next checkpoint until the end
    - Reporting / Orphan Homes and Working Copies






