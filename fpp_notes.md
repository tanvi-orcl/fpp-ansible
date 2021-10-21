
Questions
- Move GI Method? 
- When do we create a new home? 
- Which hosts do we have to run each set of tasks on (follow-up from question about image registry from session)
- what do you feel is the BASE information they would have? What else can be extrapolated? 

- fresh home with current settings installed on exadata server to get metadata without risking changed configurations
- map created from that info on fpp server, image registered, working copy created

Notes from FiServ Testing Sessions
- Their naming standards: dbhome1_191200, dbhome1_182400, dbhome1_12201_210720 (version 12), dbhome1_191200_12345678 (one off patch)
- Will be using centrify or cyberark to get the keys

 

 Lifecycle
 1. Create Image
 2. Create WorkingCopy
 3. Delete Image
 4. Delete WorkingCopy

GI Zip/Working Copy
 - Zip: What is it, how is it being used?
 - what does mcimgsetup command do? DB working copy doesn't need it?
    - Has a json outfile. It has the groups that should be used. 
 
How to Patch a DB
 - "optionally this can be omitted and all dbs will be moved" Is this something we should handle or avoid? --> avoid, best practice is one by one 

1. Any differences between ExaCC vs. ExaCS --> don't think so, because dbaas tooling
2. What is the general timeline? How often will each task be completed. My understanding is that a new patch comes out --> you create the map file --> register the image --> and then will need to create workingcopy --> and then you will patch. All three tasks are always done together right? You never would just do one? 
3. Is there an easy way to determine the values (source working copy, major version, etc) to provide at runtime? are you just remembering from before?
4. What are we doing about the current homes that are not working copies? - trying to figure out if that's a big enough edge case where I should address it 

TASKS

19.13 version database
- new 19.13 DB Home, will need to create an image from that. If they add patches to it next week, they'll need to create a new image from that. However, they shouldn't be doing that. This is an image we're going to take and test. Okay, we're happy with it, etc. etc. 
- If they're happy with it, making a working copy. Depending on their environment, groups need to match what is the RDBMS 

1. Should we be performing ssh/name resolution checks + DBaaSTools/FPE version checks before every patch
    Pre-job --> separate, optional
2. Does the -eval check if both old and new db homes are working copies? Working copy command run from the FPP node and not the db home after ssh-ing into the database homes? What is the difference between the commands? One has an additional -workingcopy
    Running from the fpp node
    -workingcopy {{ wc_name }}
4. Executing as opc user? --> oracle user

Database home --> templates/image registered with FPP --> working copy of that image. Determination to move to column from that home from another home




Create Image Map File

12.1
31106577;
30805558;Database PSU 12.1.0.2.200414, Oracle JavaVM Component (APR2020)
30703508;OCW PATCH SET UPDATE 12.1.0.2.200414 (30703508)
30691015;Database Bundle Patch : 12.1.0.2.200414 (30691015)

OPatch succeeded.

19c
[oracle@scaqai12adm03 racdb19.7.0.0.190414]$ $ORACLE_HOME/OPatch/opatch lspatches
30805684;OJVM RELEASE UPDATE: 19.7.0.0.200414 (30805684)
30869156;Database Release Update : 19.7.0.0.200414 (30869156)
30894985;OCW RELEASE UPDATE 19.7.0.0.0 (30894985)

OPatch succeeded.

rhpc query workingcopy
n3Db0: Audit ID: 100
Working copy name: wc_DB1813_210119_ecc5c4
Working copy name: wc_DB199_201020_ecc5c4
Working copy name: wc_DB199_201020_ecc5c4_test
Working copy name: wc_DB199_201020_legacy_ecc5c4
Working copy name: wc_DB1910_210119_legacy_ecc5c4
Working copy name: wc_DB1910_210119_ecc5c4
Working copy name: wc_DB1911_210420_ecc5c4

rhpc query workingcopy -workingcopy wc_DB1813_210119_ecc5c4
n3Db0: Audit ID: 101
Working copy name: wc_DB1813_210119_ecc5c4
Image name: DB1813_210119
Groups configured in the working copy: OSDBA=dba,OSOPER=racoper,OSBACKUP=dba,OSDG=dba,OSKM=dba,OSRAC=dba
Owner: oracle@iad1541clu04b22
Site: iad1541clu04b22
Access control: USER:oracle@iad1541clu04b22
Access control: USER:oracle@n3db0
Access control: ROLE:GH_WC_ADMIN
Software home path: /u02/app/oracle/product/18.0.0.0/dbhome_2
Storage type: LOCAL
Image Type: ORACLEDBSOFTWARE
Gold image path:
Work path:
Additional patches compared to the image:
Additional bug fixes that are not in the image:
Complete: TRUE

If workingcopy 





