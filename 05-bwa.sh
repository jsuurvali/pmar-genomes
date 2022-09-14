#!/bin/bash

#SBATCH -n 8
#SBATCH -N 1
#SBATCH --mem=20G
#SBATCH -t 0-12:00
#SBATCH -J bwa
#SBATCH -o bwa_%A_%a.out
#SBATCH -e bwa_%A_%a.err
#SBATCH --account=def-coling
#SBATCH --array=1-435

module load bwa/0.7.17 samtools/1.15.1


cd /scratch/suurvalj/bam

bwa mem -t 8 ../lampreyref/GCF_010993605.1_kPetMar1.pri_genomic.fna ../fastq/trimmed/${SLURM_ARRAY_TASK_ID}_trim_R1.fastq.gz ../fastq/trimmed/${SLURM_ARRAY_TASK_ID}_trim_R2.fastq.gz \
| samtools sort -@8 -o ${SLURM_ARRAY_TASK_ID}.bam

samtools index ${SLURM_ARRAY_TASK_ID}.bam
samtools view -@8 -bhf12 ${SLURM_ARRAY_TASK_ID}.bam > unmapped/${SLURM_ARRAY_TASK_ID}.unmapped.bam
