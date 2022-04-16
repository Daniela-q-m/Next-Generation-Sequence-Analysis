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

fastp -i ERR156634_1.filt.fastq.gz -I ERR156634_2.filt.fastq.gz -o out.ERR156634_1.filt.fastq.gz -O out.ERR156634_2.filt.fastq.gz --length_required=76 --n_base_limit=50  --detect_adapter_for_pe