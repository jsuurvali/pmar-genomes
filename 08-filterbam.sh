#!/bin/bash

#SBATCH -n 4
#SBATCH -N 1
#SBATCH --mem=20G
#SBATCH -t 0-00:59
#SBATCH -J bwa
#SBATCH -o filtbam_%A_%a.out
#SBATCH -e filtbam_%A_%a.err
#SBATCH --account=def-coling
#SBATCH --array=1-435


module load bwa/0.7.17 samtools/1.15.1

cd /scratch/suurvalj/bam/q20f3

samtools view -@4 -bh -f3 -F1548 -q20 ../RG/${SLURM_ARRAY_TASK_ID}.nodup.rg.bam > ${SLURM_ARRAY_TASK_ID}.nodup.rg.q20f3.bam
samtools index ${SLURM_ARRAY_TASK_ID}.nodup.rg.q20f3.bam
