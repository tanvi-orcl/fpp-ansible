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

TESTING TO DO (Broke Environment)
- rdbms_patchdb
    - continue (dbhome3_191300 --> dbhometst1_191300)
    - ignorewcpatches_param + forcerolling_param
    - revert
    - run again as is (dbhometst1_191300 --> dbhometst2_191300)
- rdbms_delete_wc
    - orphan_home
    - normal home
- gi_create_image
    - Fail Case --> Same Image Name
- gi_create_wc
    - new (with and without path)
    - existing (curr and not curr home)
    - Fail Case --> Not existing Image
    - Fail Case --> oh_dirname already exists
- gi_patch
    - ensure pre-patch script executes
    - continue
    - revert
    - Fail Case --> Source not WC, Dest not WC
    - Fail Case --> incorrectly defined flags
- multiple_homes

NOTE (if environment works on Monday lol)
- Register Working Copy - creating a new attr file with that line
    - Make sure double check if the home is active or not (check inventory file AND run ps -ef | grep crsd)
    - check in BOTH cases just to be sure


Cleanup
- do more greps when ONLY parsing outputs of a shell command a single time
- check if variables are defined correctly / exist
- debug messages: one line where possible, var where needed, and not repetitive
- setting vars vs. passing vars
- Clean Up
    - task names / comments
    - README
    - set assert name + quiet


Finalize with Fiserv
- max_fail_percentage / failure behavior
- naming standards
    - wc_name using "cluster name" instead of client_name
- any_error_fatal?
    - gihome prereqs?
- Out of Scope
    - automating Post tasks --> not working with UA because won't move to next checkpoint until the end
    - Reporting / Orphan Homes and Working Copies


NOTES

User Actions
1. Create User Action
    rhpctl add useraction -useraction run_stoptools -actionscript /u02/app/fpp/admin/useractions/test_us.sh -pre -optype MOVE_GIHOME -onerror ABORT
    to Modify/update script
    rhpctl modify useraction -useraction run_stoptools -actionscript /u02/app/fpp/admin/useractions/test_us.sh
2. Create Custom Image Type
    rhpctl add imagetype -imagetype GI_StopTools -basetype ORACLEGISOFTWARE
3. Mod CIT w/ UA
    rhpctl modify imagetype -imagetype GI_StopTools -useractions run_stoptools
4. Mod Image w/ new CIT
    rhpctl modify image -image GI1911300 -imagetype GI_StopTools

- Fiserv Naming Patterns
    - Current naming standards: dbhome1_191200, dbhome1_182400, dbhome1_12201_210720 (version 12), dbhome1_191200_12345678 (one off patch)
    -  multiple on same home -pass in your own name
    - automating naming (multiple working copies of same image on same machine)
        dbhome1_191200 --> wc1_191200_cluster
        dbhome2_191200 --> wc2_191200_cluster
        dbhome1_12201_210720 --> wc1_12201_210720_cluster
        dbhome2_12201_210720 --> wc2_12201_210720_cluster
    - cluster naming pattern: exacc: clustername-dbvm(01-08); exacs: clustername-[a-z]4(01-08)
- Seeding OCIDs in VM Clusters
    - use showoci tool to more easily get OCIDs (Scott has experience with this and will sit in)
- Will be using centrify or cyberark to get the keys