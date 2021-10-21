
Exadata Machine Cluster 1
- vm1_1
- vm2
- vm3

Exadata Machine Cluster 2
- vm1_2
- vm2
- vm3


Create Temp Image --> Pull Data into Map --> Register Image
- once per image (i.e. JUST on cluster 1)

Create new DB Home (updated) --> new Working Copy
- general execution
- once per new home per cluster (vm1_1, vm1_2) - 1 image: many working copies 
    - might have two different homes on the same cluster (and therefore 2 working copies)
    - query working copy --> make sure it doesn't exist and if it does exist, create next name

Moving it
- DB --> each DB (if unmanaged, make wc and then use source_wc)
- GI --> once per Cluster (if unmanaged, source_home)
    - right now rollback works if both wc, need to make it work for unmanaged so that customer is comfortable for that first wave --> FPP team working on this
    - move failed right off the bat because using ACFS. GI Processes have to stop in the old home and start in the new home.
        - should consider using an agent
        - if not, can use batches field in move command: olsnodes


[2:11 PM] Speaker, Roy (Hagerstown)
    systemctl stop crond - on all 4 nodes
​[2:11 PM] Speaker, Roy (Hagerstown)
    *both nodes
​[2:11 PM] Speaker, Roy (Hagerstown)
    /linux/stoptools.sh - on both nodes
