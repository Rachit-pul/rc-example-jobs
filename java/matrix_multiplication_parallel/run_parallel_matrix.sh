#!/bin/bash

#SBATCH --job-name=parallel_matrix_multiplication   # Job name
#SBATCH --output=matrix_multiplication.%J.out          # Output file for stdout
#SBATCH --error=matrix_multiplication.%J.err           # Output file for stderr
#SBATCH --ntasks=1                                  # Number of tasks (1 task running ForkJoinPool)
#SBATCH --cpus-per-task=64                           # Number of CPU cores per task (adjust based on desired concurrency)
#SBATCH --time=02:00:00                             # Time limit hrs:min:sec
#SBATCH --mem=16G                                   # Memory limit per nodes



# Load any necessary modules (adjust depending on your system)

module load java  # Load Java

# Compile java
javac ParallelMatrixMultiplication.java
# Run java
java ParallelMatrixMultiplication


