#!/bin/bash 

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
. $SCRIPTPATH/config_vars.sh

cd $WORKDIR
mkdir -p NEMO
cd NEMO

# If not downloaded, download NEMO
if [ ! -d "NEMOGCM" ]; then
  svn co http://forge.ipsl.jussieu.fr/nemo/svn/branches/UKMO/dev_r8814_surge_modelling_Nemo4/NEMOGCM NEMOGCM
fi

cd NEMOGCM

sed -e "s:\$INSTDIR:${INSTDIR}:" -e "s:\$WORKDIR:${WORKDIR}:" $SCRIPTPATH/arch_nemo/arch-local.fcm > ARCH/arch-local_$HOSTNAME.fcm