#!/bin/bash

#SBATCH -J thinning
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-00:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/thinning.%j.out
#SBATCH -e /scratch/suurvalj/thinning.%j.err
#SBATCH --account=def-coling


module load vcftools/0.1.16

vcftools --gzvcf .pmar.phased.432fish.vcf.gz --maf 0.05 --max-maf 0.95 --thin 1000 --recode --out pmar.phased.432fish.thinned
