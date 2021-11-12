- purge home / missing working copies: communication issue with OCI console

log file: /var/opt/oracle/log/fpe/grid/357256_mcimgsetup/357256_mcimgsetup_2021-11-12_20:05:33.669899357256.log

""Non-ATP env detected "
2021-11-12 20:07:58.370030 - got image_info
2021-11-12 20:07:58.370132 - (357256)unable to get image_info for GIHome_tst1.zip.gpg

2021-11-12 20:07:58.370533 - (357256)unable to get image_info for GIHome_tst1.zip.gpg
 at /var/opt/oracle/perl_lib/DBAAS/logger.pm line 554.
	logger::logerr('logger=HASH(0x1aa90a8)', '(357256)unable to get image_info for GIHome_tst1.zip.gpg\x{a}') called at /var/opt/oracle/managed/exapatch/mcimgsetup line 1852
	main::log_err('unable to get image_info for GIHome_tst1.zip.gpg\x{a}') called at /var/opt/oracle/managed/exapatch/mcimgsetup line 696
	main::prechecks() called at /var/opt/oracle/managed/exapatch/mcimgsetup line 395
2021-11-12 20:07:58.370648 - set_responsefile unable to get image_info for GIHome_tst1.zip.gpg


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


