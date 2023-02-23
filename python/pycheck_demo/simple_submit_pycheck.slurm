#!/bin/bash

#### Scheduler Directives ####

#SBATCH -A open
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 00:01:00
#SBATCH --mem=1gb
#SBATCH -o out_pycheck.txt


#### Job is launched when placed on compute nodes ####
echo " "
echo "Job started at `date` on `hostname`"
echo " "

#### Execute your job ####
python pycheck.py

#### Job Output ####
echo " "
echo "Job ended at `date`"
echo " "

