Basic Questions
- osdagrp for grid working copy? Is it ever different between outfile and pulled vals? Should they align?
- map: see if ru_version needs another 0 / if name can have 6 instead of 5 letters (home version pulled has 6 digits)
- for working copy, when creating a new home, should we be doing cswlib? does the name change when a new version comes out? If not automatically doing a cswlib, should probably still do a check to make sure version is there and then run cswlib if not.

Development Questions
- variables that would be helpful to get automatically 
    - EXACT release date for naming conventions? --> don't want to just store it cause not good long term
    - command to figure out unique db name
- figure out host vs. group for design/repeating tasks + jumping between environments
- should we have a separate task for existing homes for rdbms_wc and grid_patch?
- edge cases I'm missing?



To Do
- talk to fiserv about being able to select drop down items as they are doing for the home right now (to choose database unique name, image_name, source and dest working copies)
- finalize naming conventions with fiserv
- finish prerequisties 
    - check if variables are defined correctly early: if you check too late in the process then can result in issues
    - fpp_prereq not always run
- follow up on communication issue with OCI console (purge home / missing working copies)
- figure out rollback
- figure out how to do partial patching for grid
- remove working copies!
- remove old images?

Clean-up
- debug messages
- setting vars vs. passing vars
- task names
- comments


Friday: FPP Set-Up + Spin Up Initial DB Homes/DBs for testing
Monday: Test out RDBMS Register Image + Add Working Copy
Tuesday: Errors
Wednesday: Errors
Thursday: Test out RDBMS Move DB
Friday: Test out Grid Register Image
Monday:  Add Working Copy + Grid Move
Tuesday: Test Error Handling / Edge cases for RDBMS Tasks
Wednesday:  Test Error Handling / Edge cases for Grid Tasks
Thursday: Test Out Fiserv Grid Control (specialized script to keep everything up and running)
Friday: Final Troubleshooting / Clean-Up



