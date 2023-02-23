#!/bin/bash

#SBATCH --job-name=matrixmultiply
#SBATCH --account=open
#SBATCH --partition=open
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=00:10:00
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

# compile program
g++ matmult.cpp -o matmult.o

# executable needs M,K,N where dims are MxK * KxN = MxN
./matmult.o 1000 1200 10000
echo ""

end=`date +%s`
runtime_s=$(( end - start ))

echo "Job $SLURM_JOB_NAME ( $SLURM_JOB_ID ) ended at `date`"
echo ""
echo "Job Runtime  =  $runtime_s  sec"
echo ""
