#!/bin/bash

#SBATCH -J bcftools
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-01:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/platypus/%j.out
#SBATCH -e /scratch/suurvalj/platypus/%j.err
#SBATCH --account=def-coling

module load bcftools/1.11


cd /home/suurvalj/scratch/platypus

bcftools concat -Oz -o pmar.phased.vcf.gz pmar.biallelic.snps.miss20.phased.vcf.gz pmar.biallelic.snps.miss20_otherhalf.phased.vcf.gz pmar.biallelic.snps.miss20.subset2.phased.vcf.gz



bcftools view -S samples_sealamprey.txt pmar.phased.vcf.gz -Oz -o tmp.vcf.gz
tabix -p vcf tmp.vcf.gz

bcftools view -e 'COUNT(GT="AA")=N_SAMPLES || COUNT(GT="RR")=N_SAMPLES' tmp.vcf.gz -Oz -o pmar.phased.432fish.vcf.gz
tabix -p vcf pmar.phased.432fish.vcf.gz
rm tmp.vcf.gz
