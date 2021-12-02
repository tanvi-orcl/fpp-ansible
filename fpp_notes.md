Node List: (1,2) (3,4) (5,6); (1) (2, 3, 4, 5, 6); (1) (3, 5) (2, 4, 6)

Node List: (1,2, 3,4, 5,6)

1. Create User Action
2. Create Custom Image Type
3. Mod CIT w/ UA
4. Mod Image w/ new CIT


1.
rhpctl add useraction -useraction run_stoptools -actionscript /u02/app/fpp/admin/useractions/test_us.sh -pre -optype MOVE_GIHOME -onerror ABORT
to Modify/update script
rhpctl modify useraction -useraction run_stoptools -actionscript /u02/app/fpp/admin/useractions/test_us.sh

2.
rhpctl add imagetype -imagetype GI_StopTools -basetype ORACLEGISOFTWARE

3. 
rhpctl modify imagetype -imagetype GI_StopTools -useractions run_stoptools

4. 
rhpctl modify image -image GI1911300 -imagetype GI_StopTools

first command (node list)
- index 1
- when index 1 --> runs initial command

next bath (node list)
- index 2
- when index != 1 --> runs continue

first command (first batch): (1,2) (3,4) (5,6)
    node 1: pre-task
    node 2: pre-task
second command: continue
    ??: pre-task
third command: continue

FPP --> get list of nodes
Execute on List of Nodes --> pre-tasks
FPP --> patch
Execute on List of Nodes --> post-tasks

- Final Naming Standards for working copies / images --> multiple on same home, what is expected behavior? Increment automatically or pass in your own name?
    - cluster naming pattern right now? --> is it always clustern[0-4]
        - exacc: clustername-dbvm(01-08)
        - exacs: clustername-[a-z]4(01-08)
    - now in this case: path to dbhome1 and then wc name has it's own name (not matching!)
- patch fails? auto revert or do you want to hold it and fix it? --> there's a command for -revert
    - something on three --> easy fix then resume it. Stop and tell the DBA what the error was and if they can resume or rollback... based on the results of the investigation 
- Seeding OCIDs in VM Clusters
    - use showoci tool to more easily get OCIDs (Scott has experience with this and can sit in)


Move/Patch Notes
- DB --> each DB (if unmanaged, make wc and then use source_wc)
- GI --> once per Cluster (if unmanaged, set source_home_flag)
    - right now rollback works if both wc, need to make it work for unmanaged so that customer is comfortable for that first wave --> FPP team working on this
    - move failed right off the bat because using ACFS. GI Processes have to stop in the old home and start in the new home.
        - should consider using an agent
        - if not, can use batches field in move command: olsnodes
    - systemctl stop crond - on all 4 nodes; /linux/stoptools.sh - on both nodes

FiServ Environment
- Current naming standards: dbhome1_191200, dbhome1_182400, dbhome1_12201_210720 (version 12), dbhome1_191200_12345678 (one off patch)
    dbhome1_191200 --> wc1_191200_cluster
    dbhome2_191200 --> wc2_191200_cluster
    dbhome1_12201_210720 --> wc1_12201_210720_cluster
    dbhome2_12201_210720 --> wc2_12201_210720_cluster
- Will be using centrify or cyberark to get the keys

Dave Notes
- NOTE: WILL NEED TO MAKE RPM UPDATES ON MY EXACS ENVIRONMENT (copy file from fpp to exacs then execute)
- Path is optional, suffix
- Register Working Copy - creating a new attr file with that line
    - Make sure double check if the home is active or not (check inventory file AND run ps -ef | grep crsd)
    - check in BOTH cases just to be sure

Any differences between ExaCC vs. ExaCS --> don't think so, because dbaas tooling

TASKS

1. Should we be performing ssh/name resolution checks + DBaaSTools/FPE version checks before every patch
    Pre-job --> separate, optional
2. Does the -eval check if both old and new db homes are working copies? Working copy command run from the FPP node and not the db home after ssh-ing into the database homes? What is the difference between the commands? One has an additional -workingcopy
    Running from the fpp node
    -workingcopy {{ wc_name }}
4. Executing as opc user? --> oracle user

Database home --> templates/image registered with FPP --> working copy of that image. Determination to move to column from that home from another home

- automating naming (multiple working copies of same image on same machine)
    dbhome1_191200 --> wc1_191200_cluster
    dbhome2_191200 --> wc2_191200_cluster
    dbhome1_12201_210720 --> wc1_12201_210720_cluster
    dbhome2_12201_210720 --> wc2_12201_210720_cluster

- fatal: [ecc9c3n1]: FAILED! => {"changed": false, "msg": "The database version must be one of 11.2.0.4 or 12.1.0.2 or 12.2.0.1 or 18.0.0.0 or 19.0.0.0."}
    - currently using patch....
        - 3:26 --> 3:34 for Precheck (8)
        - 3:35 --> 3:57 (22)
    - automatic OraHome1/OraHome2 name?? very annoying for dbaascli 
        - they said they might be removing that field? what does that mean?


