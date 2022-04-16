#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=8:00:00
#SBATCH --mem=10GB
#SBATCH --job-name=slurm_template
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=<dq2033@nyu.edu>

#create a snp-only VCF

module purge

module load gatk/4.2.4.1 

gatk SelectVariants \
    -V outputweek4.vcf.gz \
    -select-type SNP \
    -O snps.vcf.gz