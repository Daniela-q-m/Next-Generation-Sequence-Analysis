#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --time=1:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=bwamem_w11
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=<dq2033@nyu.edu>


module purge


module load bwa/intel/0.7.17

ref=/scratch/work/courses/BI7653/hw3.2022/hg38/Homo_sapiens.GRCh38.dna_sm.primary_assembly.normalized.fa

bwa mem -M -t $SLURM_CPUS_PER_TASK ${ref} out.SRR7207011.filtered.fastq > SRR7207011.sam
bwa mem -M -t $SLURM_CPUS_PER_TASK ${ref} out.SRR7207017.filtered.fastq  > SRR7207017.sam
bwa mem -M -t $SLURM_CPUS_PER_TASK ${ref} out.SRR7207089.filtered.fastq  > SRR7207089.sam
