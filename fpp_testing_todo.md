- should we be creating the db homes using the console too? temp4image1 not getting deleted --> then can't use the month release date... have to use the ru version

TO DO
- Test out multiple hosts in one group! Need Dave's help setting up x8 server in fpp
- Add reporting --> Here are the clusters where it was successful and here is where it didn't get deployed and this is the error (don't have enough space to add the homes, home name already exists, etc)

Basic Clean-up
- debug messages
- setting vars vs. passing vars
- task names
- comments
- finish prerequisties 
    - check if variables are defined correctly early: if you check too late in the process then can result in issues
    - fpp_prereq not always run


TO DO Waiting on Others
- Talking With FiServ
    - automating naming (multiple working copies of same image on same machine)
        - EXACT release date for naming conventions? --> don't want to just store it cause not good long term
    - figure out rollback
    - figure out how to do partial patching for grid
    - being able to select drop down items as they are doing for the home right now (to choose database unique name, image_name, source and dest working copies)
    - max_fail_percentage / failure behavior
- New FPP Server Kit
    - rpm will need to be consistent between server and clients / be the current version --> prereq
    - Delete working copy properly
    - mcimgsetup fixes (different executable name, allow for proxy)
    - Allow for custom GI Home path (current one auto created is messy)
    - convert GIHome to WorkingCopy for Rollback --> add in existing homes for grid working copy! and do not allow patch from source home (to allow for rollback)


Questions For Fiserv
- Allowing for custom GI Home Path: what are the requirements?
- Final Naming Standards for working copies / images --> multiple on same home, what is expected behavior? Increment automatically or pass in your own name?
    - cluster naming pattern right now?
- GIHome Patch by node (dependent on Dave's internal discussion with dev)
- patch fails? auto revert or do you want to hold it and fix it? --> there's a command for -revert
- Expectations for playbook
    - any use cases we are missing?
    - Out of scope: rollback, random mid-cycle fixes automatically applied to working copies: will need to redownloaded cswlib (separate playbook)
- Seeding OCIDs in VM Clusters? 




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



