#!/bin/bash

#SBATCH --ntasks=2
#SBATCH --nodes=1
#SBATCH --mem=1G
#SBATCH -t 0-2:00
#SBATCH -J FastQC
#SBATCH -o fastqc_%j.out
#SBATCH -e fastqc_%j.err
#SBATCH --account=def-coling
#SBATCH --array=1-435

module load fastqc/0.11.9


cd /home/suurvalj/scratch/fastq/trimmed
fastqc -f fastq ${SLURM_ARRAY_TASK_ID}_trim_R*.fastq.gz -t 2 -o ../qc_logs
