#!/bin/sh
#SBATCH --job-name=star_mapping
#SBATCH --cpus-per-task=34
#SBATCH --mem=128gb
#SBATCH --time=1:55:00
#SBATCH --output=/home/opiskunova/bioinf_mipt/hw13/hm_rna_seq/logs/star.logs
#SBATCH --partition=short

export PATH="/home/opiskunova/.conda/envs/ngs/bin/STAR:$PATH"
GENOME_DIR="/projects/mipt_dbmp_biotechnology/GRCh38/"    
READS1="trimmed_R1.fastq.gz"   
READS2="trimmed_R2.fastq.gz" 
OUTPUT_DIR="alignment"

STAR \
  --runThreadN 32 \
  --runMode alignReads \
  --genomeDir $GENOME_DIR \
  --readFilesIn $READS1 $READS2\
  --readFilesCommand zcat \
  --outFileNamePrefix ${OUTPUT_DIR}/RNA_ \
  --outSAMtype BAM SortedByCoordinate \
  --quantMode GeneCounts

echo "Alignment Done"
