#!/bin/bash

#SBATCH -J bcftools
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-23:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/platypus/bcftools.%j.out
#SBATCH -e /scratch/suurvalj/platypus/bcftools.%j.err
#SBATCH --account=def-coling


module load bcftools/1.11

cd /home/suurvalj/scratch/platypus

awk 'NR < 49 || $7 == "PASS"' pmar.vcf > pmar.pass.vcf

bcftools reheader -h new_header.txt -o pmar.pass.v2.vcf pmar.pass.vcf
bgzip -c pmar.pass.v2.vcf > pmar.pass.vcf.gz
tabix -p vcf pmar.pass.vcf.gz

bcftools sort -Oz -o pmar.sorted.vcf.gz pmar.pass.vcf.gz
tabix -p vcf pmar.sorted.vcf.gz

bcftools view -S samples.txt pmar.sorted.vcf.gz -Oz -o pmar.sorted2.vcf.gz
tabix -p vcf pmar.sorted2.vcf.gz


bcftools annotate -x INFO,^FORMAT/GT pmar.sorted2.vcf.gz -Oz -o pmar.reduced.vcf.gz

zcat pmar.reduced.vcf.gz | awk '$1 ~/^#/ || (($4 == "A" || $4 == "C" || $4 == "G" || $4 == "T") && ($5 == "A" || $5 == "C" || $5 == "G" || $5 == "T"))' > pmar.biallelic.snps.vcf
