#!/bin/bash
#SBATCH -J markdup
#SBATCH -n 1
#SBATCH -t 0-11:59
#SBATCH --mem=40000
#SBATCH -o markdup.%A_%a.out
#SBATCH -e markdup.%A_%a.err
#SBATCH --account=def-coling
#SBATCH --array=1-435

module load picard/2.26.3 samtools/1.15.1

cd /home/suurvalj/scratch/bam/nodup

java -Xmx4g -jar $EBROOTPICARD/picard.jar MarkDuplicates REMOVE_DUPLICATES=true VALIDATION_STRINGENCY=SILENT I=../bwa/${SLURM_ARRAY_TASK_ID}.bam O=${SLURM_ARRAY_TASK_ID}.nodup.bam M=../nodup_metrics/${SLURM_ARRAY_TASK_ID}.txt TAGGING_POLICY=All
samtools index ${SLURM_ARRAY_TASK_ID}.nodup.bam
