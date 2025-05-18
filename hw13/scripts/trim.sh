#!/bin/sh

#SBATCH --job-name=fastp  	# Job name
#SBATCH --cpus-per-task=40     	# Run on a single CPU
#SBATCH --mem=256gb             	# Job memory request
#SBATCH --time=1:55:00       	# Time limit hrs:min:sec
#SBATCH --output=/home/opiskunova/bioinf_mipt/hw13/hm_rna_seq/trimmed/logs/fastp_slurm.log  # Standard output and error log
#SBATCH --partition=short

cd /home/opiskunova/bioinf_mipt/hw13/hm_rna_seq/trimmed;
ls /home/opiskunova/bioinf_mipt/hw13/hm_rna_seq/trimmed/*.fastq.gz | parallel -j2 "fastp -w 20 -i Erik_mat_CD4_MiLab_S52_R1_001.fastq.gz -I Erik_mat_CD4_MiLab_S52_R2_001.fastq.gz -o trimmed_R1.fastq.gz -O trimmed_R2.fastq.gz --unpaired1 unpaired_R1.fastq.gz --unpaired2 unpaired_R2.fastq.gz -x -5 -r -f 15 -t 10 -M 25"
