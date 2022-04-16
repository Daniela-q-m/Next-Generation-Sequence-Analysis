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

# use the Samtools stats program to determine coverage (average coverage genomewide) for paired-end (2 x 51 PE) reads from a Chlamydomonas strain (CC-2342)

module purge

module load samtools/intel/1.14

samtools stats CR2342.bam > CR2342_coverage_stats