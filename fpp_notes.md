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
- Will be using centrify or cyberark to get the keys


Any differences between ExaCC vs. ExaCS --> don't think so, because dbaas tooling

What is the general timeline? How often will each task be completed? --> My understanding is that a new patch comes out, you create the map file, register the image, and then will need to create workingcopy for each databse home you would like to patch to that level, and then you patch each db/grid. 


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




