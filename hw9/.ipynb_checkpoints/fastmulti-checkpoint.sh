#!/bin/sh
#SBATCH --job-name=multiqc        # Job name
#SBATCH --cpus-per-task=40         # Run on a single CPU
#SBATCH --mem=25gb                 # Job memory request
#SBATCH --time=00:15:00           # Time limit hrs:min:sec
#SBATCH -o logs/multiqc.log  # Standard output file
#SBATCH -e logs/multiqc.err  # Standard error file
#SBATCH --partition=short         # Task priority
#SBATCH --constraint=compute      # Node type 

cd /home/opiskunova/bioinf_mipt/hw9/
mkdir fastqc_result
fastqc ERR*.gz -o fastqc_result
cd fastqc_result
multiqc .
