#!/bin/bash
#SBATCH --time=4:00:00
#SBATCH --account=def-coling
#SBATCH --mem=8G
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1

cat /scratch/suurvalj/new_samples.txt | while read i; do
	cat /scratch/suurvalj/newdata/KHA20856/${i}_L00*_R1_001.fastq.gz > /scratch/suurvalj/fastq/KHA20856/${i}_R1.fastq.gz
	cat /scratch/suurvalj/newdata/KHA20856/${i}_L00*_R2_001.fastq.gz > /scratch/suurvalj/fastq/KHA20856/${i}_R2.fastq.gz
done
