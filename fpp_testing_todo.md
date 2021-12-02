
Talk Over With Dave
- figure out if we should allow for additional parameters on fpp commands (date, etc); when ignorerollingpatches, etc should be allowed
- Post tasks: if use post user action, will it still run on failure? I.e. to allow for cleanup? 
- Batches Error Handling
    - Retries for GI Home vs DB
    - Revert for GI Home vs DB
- Retries
    - earlier we said we can't run eval... but why not? If we are retrying, don't we want to make sure all is accurate

TO DO
- Test out multiple hosts in one group wherever possible
- Set flag for retry/revert

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

- Add reporting
    - Here are the clusters where it was successful and here is where it didn't get deployed and this is the error (don't have enough space to add the homes, home name already exists, etc)
- Check for Orphan Homes / Working Copies --> out of scope

Finalize with Fiserv
- max_fail_percentage / failure behavior
- naming standards





