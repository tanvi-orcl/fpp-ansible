
TO DO
- TEST
    - create workingcopy from existing gi home
    - GI Upgrade
    - multiple hosts in one group (where possible)
    - continue on a failed database patch
    - revert on a failed database patch
- Create pre-gihome script
    - Set correct permissions / owner for action script
- Organization
    - should we be running these tasks from the same servers we are patching/doing working copies? I.e. when should the main playbook be running from "exahost" --> could it run from localhost??
- figure out if we should allow for additional parameters on fpp commands (date, etc); when ignorerollingpatches, etc should be allowed
- do more greps when ONLY parsing outputs of a shell command a single time
- check if variables are defined correctly / exist
- do proper clean-up on failures
- debug messages: one line where possible, var where needed, and not repetitive
- setting vars vs. passing vars
- Clean Up
    - task names / comments
    - README
    - set assert name + quiet

Finalize with Fiserv
- max_fail_percentage / failure behavior
- naming standards
- any_error_fatal?
    - gihome prereqs?
- Out of Scope
    - automating Post tasks --> not working with UA because won't move to next checkpoint until the end
    - Reporting / Orphan Homes and Working Copies






