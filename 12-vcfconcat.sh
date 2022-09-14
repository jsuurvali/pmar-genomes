#!/bin/bash

#SBATCH -J concat
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-01:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/concat.%j.out
#SBATCH -e /scratch/suurvalj/concat.%j.err
#SBATCH --account=def-coling


module load vcftools/0.1.16

cd /home/suurvalj/scratch/platypus/vcf
vcf-concat *vcf > ../pmar.vcf
