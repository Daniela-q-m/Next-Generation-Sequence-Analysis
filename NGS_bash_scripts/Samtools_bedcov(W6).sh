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

#use samtools bedcov to generate a covereage depth value for all non-overlapping 500 bp intervals on chromosome_1 for the both samples CR407 and CR2342


module purge

module load samtools/intel/1.14

samtools bedcov chromosome_1.500bp_intervals.bed CR407.bam CR2342.bam > bedcovresults