#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=8:00:00
#SBATCH --mem=10GB
#SBATCH --job-name=slurm_template
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=<dq2033@nyu.edu>


#use ANGSD to generate a table of genotype likelihoods at sites that are likely to be polymorphic in a set of 30 small BAM files from the 1000 Genomes Project.

module purge

module load angsd/intel/0.933

angsd -bam bamfiles_for_GLs.txt -P ${SLURM_CPUS_PER_TASK} -GL 2 -doMajorMinor 1 -doMaf 1 -SNP_pval 2e-6 -minMapQ 30 -minQ 20 -minInd 25 -minMaf 0.05 -doGlf 2 -out GLs.gz

