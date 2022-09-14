#!/bin/bash
#SBATCH -J addrg
#SBATCH -n 1
#SBATCH -t 0-00:59
#SBATCH --mem=4000
#SBATCH -o markdup.%A_%a.out
#SBATCH -e markdup.%A_%a.err
#SBATCH --account=def-coling
#SBATCH --array=1-435

module load picard/2.26.3 samtools/1.15.1

cd /home/suurvalj/scratch/bam/RG

java -Xmx4g -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups INPUT=../nodup/${SLURM_ARRAY_TASK_ID}.nodup.bam OUTPUT=${SLURM_ARRAY_TASK_ID}.nodup.rg.bam RGID=id${SLURM_ARRAY_TASK_ID} RGLB=lb${SLURM_ARRAY_TASK_ID} RGPL=illumina RGPU=illumina RGSM=sm${SLURM_ARRAY_TASK_ID}
samtools index ${SLURM_ARRAY_TASK_ID}.nodup.rg.bam
