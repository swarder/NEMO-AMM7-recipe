# NEMO-AMM7-recipe
Singularity recipe for installing NEMO prerequisites, and scripts for configuring and running AMM7 model

Scripts installing prerequisites and downloading NEMO source code are modified from https://github.com/rcaneill/NEMO-installs (Copyright (c) 2019 Romain Caneill)
Modified here under MIT licence https://github.com/rcaneill/NEMO-installs/blob/master/LICENSE

To build recipe:
```
sudo singularity build --sandbox nemo_container.sing Singularity
```

To launch shell:
```
singularity shell --writable nemo_container.sing
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
mpirun --allow-run-as-root -np 6 ./opa : -np 1 ./xios_server.exe
```
