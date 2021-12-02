#!/bin/sh
UA_PATH_ARG=$4
ORACLE_HOME=$(echo $UA_PATH_ARG| cut -d'=' -f 2)
export ORACLE_HOME
if [ ! -f /opt/oracle.cellos/ORACLE_CELL_OS_IS_SETUP ]
then
    echo "linking $ORACLE_HOME for UDP";
    $ORACLE_HOME/OPatch/opatch lsinv > /tmp/rhptest_lsinv.`hostname`.`date +"%Y%m%d-%H%M%S"`.txt
else
    echo "linking $ORACLE_HOME for RDS";
    $ORACLE_HOME/OPatch/opatch lsinv -details > /tmp/rhptest_lsinvdetails.`hostname`.`date +"%Y%m%d-%H%M%S"`.txt
fi
echo " -----------------"
echo " -----------------"
echo " DONE with UserActions"
return 0