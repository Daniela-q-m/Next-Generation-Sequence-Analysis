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

#Call SNPs and Genotypes with GenotypeGVCFs

module purge

module load gatk/4.2.4.1 

gatk --java-options "-Xmx8g" GenotypeGVCFs \
   -R /scratch/work/courses/BI7653/hw3.2022/hg38/Homo_sapiens.GRCh38.dna_sm.primary_assembly.normalized.fa \
   -V /scratch/work/courses/BI7653/hw4.2022/cohort.g.vcf.gz \
   -O outputweek4.vcf.gz \
   --allow-old-rms-mapping-quality-annotation-data