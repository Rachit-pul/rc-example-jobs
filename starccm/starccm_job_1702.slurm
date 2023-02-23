#!/bin/bash 

#SBATCH --job-name=starjob
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=24 
#SBATCH --mem=16GB
#SBATCH --time=01:00:00 
#SBATCH --partition=open 

module load starccm

starccm+ -batch -np $SLURM_NTASKS_PER_NODE -mpi openmpi Test.sim >&output.txt

