#!/bin/bash

cd /home/data/Alex/Apples/Alignments/

for i in `ls Sample*/*bam | sed 's/_sorted.bam//'`
  do
      echo ""
      echo ">>>>>>>>>>>>>>>>>>>> $i Variant Calling begun <<<<<<<<<<<<<<<<<<<<<<"
      echo ""
      freebayes -f ../ST5019G_1.fasta $i\_sorted.bam \
      --min-supporting-allele-qsum 10 \
      --min-base-quality 20 \
      --read-mismatch-limit 4 \
      --min-coverage 4 \
      --min-alternate-count 2 \
      --report-genotype-likelihood-max \
      --exclude-unobserved-genotypes \
      --genotype-qualities \
      --ploidy 2 \
      --min-alternate-fraction 0.166666666667 \
      --targets ../NGS1221_ST5019G_2_targets.bed \
      --report-monomorphic \
      -X \
      --mismatch-base-quality-threshold 10 \
      > $i\_OriginalParam.vcf
      echo ""
      echo ">>>>>>>>>>>>>>>>>>> $i Variant Calling Complete <<<<<<<<<<<<<<<<<<<<"
      echo ""
    done

printf "VCF Original Param Output Complete" | mail -s "VCF Output Complete" a.paterson@bristol.ac.uk

# -X              Replacing --no-mnps
# --no-complex    No longer found
