
- figure out if we should allow for additional parameters on fpp commands (date, etc); when ignorerollingpatches, etc should be allowed

- batches --> figure out syntax / how to figure out current nodes for pre-tasks/post-tasks
    - revert
    - retries for GI Home

- check mcimgsetup version / fpp rpm version (rpm will need to be consistent between server and clients / be the current version)

- Test out multiple hosts in one group wherever possible

- Add reporting
    - max_fail_percentage / failure behavior
    - Here are the clusters where it was successful and here is where it didn't get deployed and this is the error (don't have enough space to add the homes, home name already exists, etc)
    - Check for Orphan Homes
    - Check for Orphan Working Copies

- ORGANIZATION
    - do more greps for when ONLY parsing outputs of a shell command
    - behavior on errors (handling + finish revert/retry playbooks)
        - check if variables are defined correctly early: if you check too late in the process then can result in issues
    - finalize code organization

- Basic Clean Up
    - debug messages - one line and only when needed
    - set assert msg
    - setting vars vs. passing vars
    - task names / comments

