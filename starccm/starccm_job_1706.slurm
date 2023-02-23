#!/bin/bash 

#SBATCH --job-name=starjob
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=24 
#SBATCH --mem=16GB
#SBATCH --time=01:00:00 
#SBATCH --partition=open 

module use /storage/icds/RISE/sw8/modules
module load starccm/17.06.008-R8

starccm+ -batch -np $SLURM_NTASKS_PER_NODE -mpi openmpi Test.sim >&output.txt
