#!/bin/bash 

export HOSTNAME=$(hostname)

# directories
export WORKDIR=/nemo/installations/sources
mkdir -p $WORKDIR
export INSTDIR=/nemo/installations/installs

# compilers
export CC=/usr/bin/mpicc
export CXX=/usr/bin/mpicxx
export FC=/usr/bin/mpif90
export F77=/usr/bin/mpif77

# compiler flags (except for libraries)
export CFLAGS="-O3 -fPIC"
export CXXFLAGS="-O3 -fPIC"

export F90FLAGS="-O3 -fPIC"
export FCFLAGS="-O3 -fPIC"
export FFLAGS="-O3 -fPIC"

export LDFLAGS="-O3 -fPIC "
# FLAGS FOR F90  TEST-EXAMPLES
export FCFLAGS_f90="-O3 -fPIC "


