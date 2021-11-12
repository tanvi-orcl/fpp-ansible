- purge home / missing working copies: communication issue with OCI console

log file: /var/opt/oracle/log/fpe/grid/11037_mcimgsetup/11037_mcimgsetup_2021-11-12_18:32:36.26940611037.log

""Non-ATP env detected ", "oss_patch:Failure cannot get updated information from  https://objectstorage.us-phoenix-1.oraclecloud.com/p/6601NpB_wNK4rX2pOAfNHzEc9pg5cJFqOd9BkofHW8rt3H71aduWdtumBwCaxARN/n/orasenatdoracledigital01/b/Ansible/o/exa_map"

2021-11-12 18:34:02.481225 - Output from cmd /bin/curl --retry 10 --retry-delay 1 --retry-max-time 20 -sb -H "Accept: application/json" --noproxy "*"  https://objectstorage.us-phoenix-1.oraclecloud.com/p/6601NpB_wNK4rX2pOAfNHzEc9pg5cJFqOd9BkofHW8rt3H71aduWdtumBwCaxARN/n/orasenatdoracledigital01/b/Ansible/o/exa_map  run on localhost  is:
2021-11-12 18:38:29.758173 - cmd took 267.276624917984 seconds
2021-11-12 18:38:29.758316 - WARN : non-zero status returned
  Command: /bin/curl --retry 10 --retry-delay 1 --retry-max-time 20 -sb -H "Accept: application/json" --noproxy "*"  https://objectstorage.us-phoenix-1.oraclecloud.com/p/6601NpB_wNK4rX2pOAfNHzEc9pg5cJFqOd9BkofHW8rt3H71aduWdtumBwCaxARN/n/orasenatdoracledigital01/b/Ansible/o/exa_map 
  Exit: 7
  Command has no output
2021-11-12 18:38:29.758763 - oss_patch:Failure cannot get updated information from  https://objectstorage.us-phoenix-1.oraclecloud.com/p/6601NpB_wNK4rX2pOAfNHzEc9pg5cJFqOd9BkofHW8rt3H71aduWdtumBwCaxARN/n/orasenatdoracledigital01/b/Ansible/o/exa_map
2021-11-12 18:38:29.758869 - got image_info



clean-up issues
- image_name and wc_name: naming conventions vs. when to specify? esp if wc_name utilizes image_name
- should there be standalone query image, query wc?
- ru_version needs another 0 for map?
- figure out host vs. group for jumping between environments


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
    - execution design
    - debug statements
    - names / comments


