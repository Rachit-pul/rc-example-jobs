#!/bin/bash

#SBATCH --job-name=nsin_R
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=1GB
#SBATCH --time=00:01:00
#SBATCH --output=%x.%j.out

module use /storage/icds/RISE/sw8/modules
module load r

srun Rscript read_nsin.R
