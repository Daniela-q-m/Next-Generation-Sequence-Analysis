#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=slurm_week5_task3
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=<dq2033@nyu.edu>

module purge

module load ngsadmix/intel/20210224

NGSadmix -likes Demo1input.gz -K 3 -minMaf 0.05 -seed 1 -o Demo1NGSadmix