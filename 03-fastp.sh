#!/bin/bash

#SBATCH -n 4
#SBATCH -N 1
#SBATCH --mem=20G
#SBATCH -t 0-1:00
#SBATCH -J fastp
#SBATCH -o trim_%j.out
#SBATCH -e trim_%j.err
#SBATCH --account=def-coling
#SBATCH --array=1-435

module load fastp/0.23.1


cd /home/suurvalj/scratch/fastq/raw

fastp \
-i ${SLURM_ARRAY_TASK_ID}_R1.fastq.gz \
-I ${SLURM_ARRAY_TASK_ID}_R2.fastq.gz \
-o ../trimmed/${SLURM_ARRAY_TASK_ID}_trim_R1.fastq.gz \
-O ../trimmed/${SLURM_ARRAY_TASK_ID}_trim_R2.fastq.gz \
-j ../qc_logs/${SLURM_ARRAY_TASK_ID}.fastp.json \
-h ../qc_logs/${SLURM_ARRAY_TASK_ID}.fastp.html \
--detect_adapter_for_pe \
--adapter_sequence AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
--adapter_sequence_r2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
--thread 4 \
--fix_mgi_id \
-c -g -D -l 70
