# NEMO-AMM7-recipe
Singularity recipe for installing NEMO prerequisites, and scripts for configuring and running AMM7 model

Scripts installing prerequisites and downloading NEMO source code are modified from https://github.com/rcaneill/NEMO-installs (Copyright (c) 2019 Romain Caneill)
Modified here under MIT licence https://github.com/rcaneill/NEMO-installs/blob/master/LICENSE

AMM7 configuration based on https://zenodo.org/record/4022310

The image can be pulled from Singularity Hub:
```
singularity pull shub://swarder/NEMO-AMM7-recipe:latest
```

Alternatively, the recipe can be built locally:
```
sudo singularity build --sandbox NEMO_AMM7.simg Singularity
```

Once pulled or built, launch the shell (replace file name as appropriate):
```
singularity shell NEMO-AMM7-recipe_latest.sif
```

Define working directory
```
export WORKDIR=/home/$USER/nemo_workdir
```

Then configure AMM7 within container
```
cd $WORKDIR
cp /nemo/installations/configure_amm7.sh .
./configure_amm7.sh
```

Finally, run NEMO
```
cd $WORKDIR/NEMOGCM/CONFIG/AMM7_SURGE/EXP_tideonly
mpirun -np 6 ./opa : -np 1 ./xios_server.exe
```
