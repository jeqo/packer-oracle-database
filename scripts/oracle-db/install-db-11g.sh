df

su $OS_USER -c "mkdir $ORACLE_BASE"
su $OS_USER -c "mkdir $ORACLE_HOME"
su $OS_USER -c "mkdir $ORACLE_INVENTORY"

cd $DB_INSTALL_DIR
unzip $DB_ZIP
unzip $DB_ZIP2


cat > /home/$OS_USER/db-install.rsp <<EOF
####################################################################
## Copyright(c) Oracle Corporation 1998,2011. All rights reserved.##
##                                                                ##
## Specify values for the variables listed below to customize     ##
## your installation.                                             ##
##                                                                ##
## Each variable is associated with a comment. The comment        ##
## can help to populate the variables with the appropriate        ##
## values.							  ##
##                                                                ##
## IMPORTANT NOTE: This file contains plain text passwords and    ##
## should be secured to have read permission only by oracle user  ##
## or db administrator who owns this installation.                ##
##                                                                ##
####################################################################
oracle.install.responseFileVersion=/oracle/install/rspfmt_dbinstall_response_schema_v11_2_0
oracle.install.option=INSTALL_DB_SWONLY
#ORACLE_HOSTNAME=$DB_HOSTNAME
UNIX_GROUP_NAME=$OS_GROUP
INVENTORY_LOCATION=$ORACLE_INVENTORY
SELECTED_LANGUAGES=en
ORACLE_HOME=$ORACLE_HOME
ORACLE_BASE=$ORACLE_BASE
oracle.install.db.InstallEdition=$ORACLE_DB_EDITION
oracle.install.db.EEOptionsSelection=false
oracle.install.db.optionalComponents=oracle.rdbms.partitioning:11.2.0.3.0,oracle.oraolap:11.2.0.3.0,oracle.rdbms.dm:11.2.0.3.0,oracle.rdbms.dv:11.2.0.3.0,oracle.rdbms.lbac:11.2.0.3.0,oracle.rdbms.rat:11.2.0.3.0
oracle.install.db.DBA_GROUP=$OS_DBA_GROUP
oracle.install.db.OPER_GROUP=$OS_DBA_GROUP
oracle.install.db.CLUSTER_NODES=
oracle.install.db.isRACOneInstall=
oracle.install.db.racOneServiceName=
oracle.install.db.config.starterdb.type=
oracle.install.db.config.starterdb.globalDBName=
oracle.install.db.config.starterdb.SID=
oracle.install.db.config.starterdb.characterSet=AL32UTF8
oracle.install.db.config.starterdb.memoryOption=true
oracle.install.db.config.starterdb.memoryLimit=
oracle.install.db.config.starterdb.installExampleSchemas=false
oracle.install.db.config.starterdb.enableSecuritySettings=true

###############################################################################
#                                                                             #
# Passwords can be supplied for the following four schemas in the	      #
# starter database:      						      #
#   SYS                                                                       #
#   SYSTEM                                                                    #
#   SYSMAN (used by Enterprise Manager)                                       #
#   DBSNMP (used by Enterprise Manager)                                       #
#                                                                             #
# Same password can be used for all accounts (not recommended) 		      #
# or different passwords for each account can be provided (recommended)       #
#                                                                             #
###############################################################################
oracle.install.db.config.starterdb.password.ALL=
oracle.install.db.config.starterdb.password.SYS=
oracle.install.db.config.starterdb.password.SYSTEM=
oracle.install.db.config.starterdb.password.SYSMAN=
oracle.install.db.config.starterdb.password.DBSNMP=
oracle.install.db.config.starterdb.control=DB_CONTROL
oracle.install.db.config.starterdb.gridcontrol.gridControlServiceURL=

###############################################################################
#                                                                             #
# SPECIFY BACKUP AND RECOVERY OPTIONS                                 	      #
# ------------------------------------		                              #
# Out-of-box backup and recovery options for the database can be mentioned    #
# using the entries below.						      #
#                                                                             #
###############################################################################
oracle.install.db.config.starterdb.automatedBackup.enable=false
oracle.install.db.config.starterdb.automatedBackup.osuid=
oracle.install.db.config.starterdb.automatedBackup.ospwd=
oracle.install.db.config.starterdb.storageType=
oracle.install.db.config.starterdb.fileSystemStorage.dataLocation=
oracle.install.db.config.starterdb.fileSystemStorage.recoveryLocation=
oracle.install.db.config.asm.diskGroup=
oracle.install.db.config.asm.ASMSNMPPassword=
MYORACLESUPPORT_USERNAME=
MYORACLESUPPORT_PASSWORD=
SECURITY_UPDATES_VIA_MYORACLESUPPORT=
DECLINE_SECURITY_UPDATES=true
PROXY_HOST=
PROXY_PORT=
PROXY_USER=
PROXY_PWD=
PROXY_REALM=
COLLECTOR_SUPPORTHUB_URL=
oracle.installer.autoupdates.option=SKIP_UPDATES
oracle.installer.autoupdates.downloadUpdatesLoc=
AUTOUPDATES_MYORACLESUPPORT_USERNAME=
AUTOUPDATES_MYORACLESUPPORT_PASSWORD=
EOF

su $OS_USER -c "$DB_INSTALL_DIR/database/runInstaller -silent -debug -waitforcompletion -responseFile /home/$OS_USER/db-install.rsp"
su root -c "sh $ORACLE_INVENTORY/orainstRoot.sh"
su root -c "sh $ORACLE_HOME/root.sh"
