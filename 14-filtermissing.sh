#!/bin/bash

#SBATCH -J vcfilt
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-00:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/platypus/vcfilt.%j.out
#SBATCH -e /scratch/suurvalj/platypus/vcfilt.%j.err
#SBATCH --account=def-coling

module load vcftools/0.1.16

cd /home/suurvalj/scratch/platypus
vcftools --vcf pmar.biallelic.snps.vcf --max-missing 0.8 --recode --out tmp
mv tmp.recode.vcf pmar.biallelic.snps.miss20.vcf
