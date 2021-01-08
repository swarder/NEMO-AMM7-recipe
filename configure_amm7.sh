export INSTDIR=/nemo/installations

export CONFIG=AMM7_SURGE
export WDIR=$WORKDIR/$CONFIG
export NEMO_INSTDIR=$WORKDIR/NEMOGCM

export INPUTS=$WDIR/INPUTS
export START_FILES=$WDIR/START_FILES
export CDIR=$NEMO_INSTDIR/CONFIG
export TDIR=$NEMO_INSTDIR/TOOLS
export EXP=$CDIR/$CONFIG/EXP_tideonly

# Download NEMO
cd $WORKDIR
svn co http://forge.ipsl.jussieu.fr/nemo/svn/branches/UKMO/dev_r8814_surge_modelling_Nemo4/NEMOGCM $NEMO_INSTDIR
cd $NEMO_INSTDIR
cp $INSTDIR/install_scripts/arch_nemo/arch-local.fcm ARCH/arch-local_$HOSTNAME.fcm



cd $WORKDIR
git clone https://github.com/JMMP-Group/AMM7_surge.git $CONFIG
cd $CONFIG

mkdir $EXP
ln -s $INPUTS $EXP/bdydta

rsync -vt MY_SRC/* $CDIR/$CONFIG/MY_SRC

rsync -vt EXP_tideonly/* $EXP

ln -s  $INSTDIR/sources/XIOS/xios-2.5/bin/xios_server.exe $EXP/xios_server.exe


echo "bld::tool::fppkeys  key_nosignedzero key_diainstant key_mpp_mpi key_iomput key_diaharm_fast key_FES14_tides" > $CDIR/$CONFIG/cpp_AMM7_SURGE.fcm


cd $CDIR
# This avoids a compilation error, but is it the correct fix?
sed -i 's/vbfr/vbf/g' AMM7_SURGE/MY_SRC/diaharm_fast.F90
sed -i 's/ubfr/ubf/g' AMM7_SURGE/MY_SRC/diaharm_fast.F90
./makenemo -n $CONFIG -m "local_$HOSTNAME"


ln -s $CDIR/$CONFIG/BLD/bin/nemo.exe $EXP/opa

cd $INPUTS
wget https://github.com/JMMP-Group/AMM7_surge/releases/download/v0.0.9/AMM7_FES2014_tides.tar.gz
tar -xvf AMM7_FES2014_tides.tar.gz

cd $EXP
wget https://github.com/JMMP-Group/AMM7_surge/releases/download/v0.0.9/domain_cfg.nc.gz
gunzip domain_cfg.nc.gz
