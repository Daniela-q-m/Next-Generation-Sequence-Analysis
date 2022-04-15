# Next-Generation-Sequence-Analysis
The purpose of this repository is to store slrum scripts, input and output files for NGS Analysis. Some of the analyses included in this repository are FASTQC analysis, genome alignment, SNP calling, and population genomics. Each folder contains a workflow file that includes a step by step of each analysis. 

A short description of each of the folders within this repository:

## NGS Course Projects
This folder contains the projects completed in the course 'Next Generation Sequence Analysis' BIGY7653 at New York University. See below for a short description of each of the projects that have been completed and what the goals of each project were. 

         
### Align reads to the human reference genome (W3)
-prepare a copy human reference genome for short read alignment with the Burrows-Wheeler Aligner BWA-MEM (Homo_sapiens.GRCh38), normalize using  Picard-Tools NormalizeFasta program: https://broadinstitute.github.io/picard/command-line-overview.html#NormalizeFasta. Picard removes any white spaces in sequence identifers in the reference FASTA.<br> 
-Create a FASTA index and a bwa index for the normalized reference genome as well as dictionary file required by the Genome Analysis Toolkit (GATK).<br> 
  &nbsp; Requirements for the reference by GATK: https://gatk.broadinstitute.org/hc/en-us/articles/360035531652-FASTA-Reference-genome-format<br> 
  &nbsp; Samtools manual for the samtools faidx command: http://www.htslib.org/doc/samtools.html<br> 
  &nbsp; BWA manual for bwa index here: http://bio-bwa.sourceforge.net/bwa.shtml<br> 
-Count reads<br> 
 
### Call snps and genotypes (W4)
-Call snps and genotypes (with GenotypeGVCFs) from 30 samples from the 1000 Human Genomes Project<br> 
-Apply a set of hard filters to the callset<br> 
-Workflow steps:<br> 
  &nbsp; -Align reads with BWA-MEM<br> 
  &nbsp; -Coordinate-sort<br> 
  &nbsp; -Mark PCR duplicates<br> 
  &nbsp; -Base Quality Score Recalibration (BQSR)<br> 
  &nbsp; -Run HaplotypeCaller to create .gvcf files<br> 
  &nbsp; -Run CombineGVCFs<br> 
  &nbsp; -Run GenotypeGVCFs<br> 
  &nbsp; -Perform Variant Quality Score Recalibration<br> 
  &nbsp; -Perform hard filtering of VCF<br> 
  
  
### Population Genomics (W5)
-Assess genotype qualities in the Variant Call Format (VCF)<br> 
-Analyze likelihooods in low coverage sequencing analysis<br> 
-Calculate genotype likelihoods for population genomic analysis<br> 
-Estimate genetic ancestry in low coverage data<br> 

### Coverage Depth and Copy Number Variant Discovery (W6)
-Use Samtools stats program to determine coverage (average coverage genomewide) for paired-end (2 x 51 PE) reads from a Chlamydomonas strain (CC-2342)<br> 
-Calculate depth per base position using a single samtools depth command for the region chromosome_1:10001-10020 from the sample alignment for Chlamydomonas strain<br> 
-Calculate coverage depth in genomic intervals to identify a copy number variant <br> 



### Genome Alignment (Using STAR) (W8)
-Align and coordinate sort RNA-seq reads to a reference genome assembly with the STAR aligner. <br>
-Create a BAM index file for each sample.<br>
-The RNA-seq data are from date palm fruit. In this experiment, researchers wished to test for differential gene expression between varieties of date palm with high fruit sucrose content (n=4) versus those with trace amounts of sucrose (n=4). The goal was to determine if a group of linked invertase enzymes identified by Genome Wide Association Study (GWAS) showed DGE between varieties with the two sugar phenotypes.<br>

### Differential Gene Expression Analysis (W9)
-Conduct a test of differential gene expression (DGE) between samples from the four date palm varieties with high sucrose content versus the four with low sucrose content described in Week 8.
-The RNA-seq data in this experiment were generated on a NextSeq sequencer, processed to exclude reads that failed Illumina’s quality control filter, and then adapters removed with Trimmomatic. Reads were aligned with STAR. A read count matrix was created from each sample BAM 

### Pseudo-alignment and Differential Gene Expression Analysis (W10)
-“pseudo-alignment” based method to conduct differential gene expression (DGE) analysis with the Salmon + tximport + DESeq2 workflow.

### ChIP Seq Analysis (W11)
- Analyze a transcription factor (TF) ChIP-seq dataset from a biopsy of prostate cancer tumors. 
- Align reads from ChIP samples and a control to the human reference genome and apply a narrow peak-calling method.
- The data are single end (1 x 65 bp) fastqs sequenced on an Illumina Hi-Seq sequencer by Singh et al. 2018: https://www.life-science-alliance.org/content/2/1/e201800115
- The SRA run accession number for the reads are: SRR7207011 is the Androgen Receptor (AR) ChIP from patient 1 tumor (P1_AR_DSG) SRR7207017 is the Androgen Receptor (AR) ChIP from patient 2 tumor (P2_AR_DSG) SRR7207089 is the “input” (P_Input_DSG)
