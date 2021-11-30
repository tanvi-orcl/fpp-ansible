
TO DO

Convert legacy unmanaged GI Home into WC
- osdagrp parameter?
- where is attrfile? FPP?

- figure out if there is a way to get the ru_version from bp_version for RDBMS Add WC (if not, maybe make sure it matches...?)
- Playbooks for Errors (customer wants to wait and debug then choose to resume or rollback)
    - retry
        - GI Home?
    - revert
- Add in resumes for batches
        - move destwc -continue (waiting on discussion with Fiserv)
- finish prerequisties 
    - check if variables are defined correctly early: if you check too late in the process then can result in issues
    - check mcimgsetup version / fpp rpm version (rpm will need to be consistent between server and clients / be the current version)
- Add reporting
    - Here are the clusters where it was successful and here is where it didn't get deployed and this is the error (don't have enough space to add the homes, home name already exists, etc)
    - Check for Orphan Homes
    - Check for Orphan Working Copies
- Basic Clean Up
    - debug messages - one line and only when needed
    - set assert msg
    - setting vars vs. passing vars
    - task names / comments
- Test out multiple hosts in one group wherever possible



TO DO Waiting on Others
- Talking With FiServ
    - figure out how to do partial patching for grid
    - max_fail_percentage / failure behavior
    

Testing Schedule
- Friday: FPP Set-Up + Spin Up Initial DB Homes/DBs for testing
- Monday: Test out RDBMS Register Image + Add Working Copy
- Tuesday: Errors
- Wednesday: Errors
- Thursday: Test out RDBMS Move DB
- Friday: Test out Grid Register Image
- Monday:  Add Working Copy + Grid Move
- Tuesday: Test Out full flow for RDBMS and Grid Tasks
- Wednesday: Figured out remaining work
    - CSWLIB check BP and run only if not present
Wednesday:  Test Error Handling / Edge cases for Grid Tasks
Thursday: Test Out Fiserv Grid Control (specialized script to keep everything up and running)
Friday: Final Troubleshooting / Clean-Up


