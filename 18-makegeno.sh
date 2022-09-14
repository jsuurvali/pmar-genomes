#!/bin/bash

#SBATCH -J bcftools
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-00:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/platypus/geno.%j.out
#SBATCH -e /scratch/suurvalj/platypus/geno.%j.err
#SBATCH --account=def-coling

module load bcftools/1.11


cd /home/suurvalj/scratch/platypus
bcftools view -h pmar.phased.432fish.thinned.recode.vcf | cut -f10- | sed -e ’s/0|0/0/g’ -e ’s/1|1/2/g’ -e ’s/0|1/1/g’ -e ’s/1|0/1/g’ -e ’s/\t//g’ > pmar.phased.432fish.thinned.geno
