
TO DO

- convert current GIHome to WorkingCopy for Rollback (do not allow patch from source home)
- Playbooks for Errors (customer wants to wait and debug then choose to resume or rollback)
    - retry
        - same command, permanence forever (example: had customer screw up metadata and failed operation in that path)
            - what happens if we run eval? --> might be a failure saying "operation already in progress" but not sure... might be better to just run a retry so that way you can just be careful
        - Try with current DB once server restarted
    - revert
- Add in resumes for batches
        - move destwc -continue (waiting on discussion with Fiserv)
- Check if oh_dirname path already exists
- finish prerequisties 
    - check if variables are defined correctly early: if you check too late in the process then can result in issues
    - check mcimgsetup version / fpp rpm version (rpm will need to be consistent between server and clients / be the current version)
- Add reporting
    - Here are the clusters where it was successful and here is where it didn't get deployed and this is the error (don't have enough space to add the homes, home name already exists, etc)
    - Check for Orphan Homes
    - Check for Orphan Working Copies
- Basic Clean Up
    - debug messages - one line and only when needed
    - setting vars vs. passing vars
    - task names / comments
- Test out multiple hosts in one group wherever possible



TO DO Waiting on Others
- Talking With FiServ
    - figure out how to do partial patching for grid
    - being able to select drop down items as they are doing for the home right now (to choose database unique name, image_name, source and dest working copies)
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


