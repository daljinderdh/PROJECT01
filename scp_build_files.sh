#!/bin/sh
#
##############################################################################
# Script - scp_build_files.sh
# Purpose - Scp Operation Files to New Servername
# Version 1.0 - Dated - 1/11/24 - Initial Draft - Daljinder
# Version 1.1 - Dated - 3/11/24 - Added script dir logic - Daljinder
# Version 1.1 - Dated - 9/2/24 - Added JDK Patch - Daljinder
##############################################################################
#

HOSTN=$1
if [ -z "${HOSTN}" ]; then
echo "==> Enter HOSTS FQDN: "
read HOSTN
fi
HOSTN=$(echo ${HOSTN} | tr -d ' ')

if [ -z "${HOSTN}" ]; then
echo " usage sh scp_build_files.sh hostname "
exit;
fi

echo ""
echo "=============================================================== "
echo "  ==> Transfering BUILD the Files to -> ${HOSTN} ......."
echo "=============================================================== "
sleep 2

cd /home/oracle/
scp -r ./save oracle@${HOSTN}:/home/oracle/
scp -r ./bin oracle@${HOSTN}:/home/oracle/
scp -r ./bin oemagent@${HOSTN}:/home/oemagent/
scp -r ./dbora oracle@${HOSTN}:/home/oracle/
scp -r /home/oracle/SETENV/agent_parm_update.sh oemagent@${HOSTN}:/home/oemagent/
scp -r /home/oracle/SETENV/p35009178_180371_Linux-x86-64.zip oemagent@${HOSTN}:/home/oemagent/
# New Patch Unable to find
#scp -r /home/oracle/SETENV/p36664035_180411_Linux-x86-64.zip oemagent@${HOSTN}:/home/oemagent/
cd /home/oracle/SETENV/
scp -r ./scripts oracle@${HOSTN}:/home/oracle/
cd /home/oracle/SETENV/scripts/
scp -r .local oracle@${HOSTN}:/home/oracle/
scp -r .bash_profile oracle@${HOSTN}:/home/oracle/
scp -r .local oemagent@${HOSTN}:/home/oemagent/
scp -r .bash_profile oemagent@${HOSTN}:/home/oemagent/

echo ""
echo "=============================================================== "
echo "  ==> BUILD Files Transfering Completed."
echo "=============================================================== "
echo ""

##############
# END
##############