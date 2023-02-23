#!/bin/bash

#SBATCH --job-name=parallel_example
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=4-4
#SBATCH --ntasks-per-node=2
#SBATCH --mem-per-cpu=100mb
#SBATCH --time=00:01:00
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

start=`date +%s`

echo ""
echo "Job Name:   $SLURM_JOB_NAME"
echo "Job ID:     $SLURM_JOB_ID"
echo "Account:    $SLURM_JOB_ACCOUNT"
echo "From Loc:   $SLURM_SUBMIT_DIR"
echo "On Host:    $SLURM_SUBMIT_HOST"
echo ""
echo "# Nodes:    $SLURM_JOB_NUM_NODES"
echo "Nodelist:   $SLURM_JOB_NODELIST"
echo "Tasks/Node: $SLURM_NTASKS_PER_NODE"
echo "# Tasks:    $SLURM_NTASKS"
echo "Mem/Task:   $SLURM_MEM_PER_CPU  MB"
echo "Total Mem:  $(( $SLURM_NTASKS * $SLURM_MEM_PER_CPU ))  MB"
echo ""
echo "Current Working Directory:  `pwd`"
echo ""

srun -l bash simplecheck.sh
echo ""

end=`date +%s`
runtime_s=$(( end - start ))

echo "Job $SLURM_JOB_NAME ( $SLURM_JOB_ID ) ended at `date`"
echo ""
echo "Job Runtime  =  $runtime_s  sec"
echo ""
