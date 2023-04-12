#!/bin/bash

#SBATCH --job-name=nsin_py
#SBATCH --account=open
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=1GB
#SBATCH --time=00:01:00
#SBATCH --output=%x.%j.out

module load anaconda3

srun python read_nsin.py
