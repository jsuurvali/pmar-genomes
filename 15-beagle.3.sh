#!/bin/bash

#SBATCH -J beagle
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 1-23:59
#SBATCH --mem 4G
#SBATCH -o /scratch/suurvalj/platypus/beagle.%j.out
#SBATCH -e /scratch/suurvalj/platypus/beagle.%j.err
#SBATCH --account=def-coling


module load beagle/5.4

cd /home/suurvalj/scratch/platypus
java -jar ${EBROOTBEAGLE}/beagle.22Jul22.46e.jar gt=subset2.vcf out=pmar.biallelic.snps.miss20.subset2.phased seed=777 nthreads=1
