#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=4:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=slurm_template
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=<dq2033@nyu.edu>


module purge
  
module load fastp/intel/0.20.1 #Load fastp as it exists in module avail

fastp -i SRR7207011.fastq  -o out.SRR7207011.filtered.fastq  --length_required=60 --n_base_limit=50  
fastp -i SRR7207017.fastq  -o out.SRR7207017.filtered.fastq  --length_required=60 --n_base_limit=50  
fastp -i SRR7207089.fastq  -o out.SRR7207089.filtered.fastq  --length_required=60 --n_base_limit=50  