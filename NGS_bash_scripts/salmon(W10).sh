#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=24:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=salmon
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=<dq2033@myu.edu>
#SBATCH --array=1-8

module purge

module load salmon/1.4.0

echo The array index is: ${SLURM_ARRAY_TASK_ID}

table=/scratch/work/courses/BI7653/hw8.2022/fastqs.txt
line="$(head -n ${SLURM_ARRAY_TASK_ID} "${table}" | tail -n 1)"
sample="$(printf "%s" "${line}" | cut -f1)"
fq1="$(printf "%s" "${line}" | cut -f2)"
fq2="$(printf "%s" "${line}" | cut -f3)"

fqdir=/scratch/work/courses/BI7653/hw8.2022/fastqs
salmon_index_dir=/scratch/work/courses/BI7653/hw10.2022/datepalm_transcripts/Pdac_Barhee_chr_unan_180126.all.maker.transcripts_HC_shuffled_normalized_index
mkdir "${sample}"
cd "${sample}"

salmon quant -i ${salmon_index_dir} -l A -1 $fqdir/$fq1 -2 $fqdir/$fq2 --validateMappings --gcBias --threads ${SLURM_CPUS_PER_TASK} -o $sample.transcripts_quant

echo _ESTATUS_ [ salmon quant $sample ]: $?
echo _END_ [ salmon slurm ]: $(date)