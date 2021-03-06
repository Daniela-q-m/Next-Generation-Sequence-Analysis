#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=8:00:00
#SBATCH --mem=16GB
#SBATCH --job-name=dqw8
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=<dq2033@nyu.edu>
#SBATCH --array=1-8

module purge

# Path to 3-column (tab-delimited) table with sample name, fastq 1 file name, and fastq 2 file name


table=/scratch/work/courses/BI7653/hw8.2022/fastqs.txt

#Create a separate directory for each sample with mkdir 
# Define sample, fq1 and fq2 variables for current array index
# note: SLURM_ARRAY_TASK_ID environmental variable will contain a single value corresponding to the current array index

line="$(head -n $SLURM_ARRAY_TASK_ID $table | tail -n 1)"
sample="$(printf "%s" "${line}" | cut -f1)"
fq1="$(printf "%s" "${line}" | cut -f2)"
fq2="$(printf "%s" "${line}" | cut -f3)"


# Print to standard out the array index and the sample name

echo Processing array index: $SLURM_ARRAY_TASK_ID sample: $sample

# Make a directory for the sample and cd to it

mkdir $sample
cd $sample

# Load STAR, run star commands

module load star/intel/2.7.6a

STAR --genomeDir /scratch/work/courses/BI7653/hw8.2022/STAR.genome \
--runMode alignReads \
-–runThreadN ${SLURM_CPUS_PER_TASK} \
--outSAMtype BAM SortedByCoordinate \
--readFilesCommand zcat \
--outFileNamePrefix $sample \
--readFilesIn  /scratch/work/courses/BI7653/hw8.2022/fastqs/${fq1} /scratch/work/courses/BI7653/hw8.2022/fastqs/${fq2} \
--outTmpDir ${SLURM_TMPDIR}/${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID} \
-–limitBAMsortRAM 20000000000 \


module purge

module load samtools/intel/1.14

samtools index ${sample}Aligned.sortedByCoord.out.bam ${sample}Aligned.sortedByCoord.out.bai

