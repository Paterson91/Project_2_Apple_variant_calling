#!/bin/bash

cd /home/data/Alex/Apples/Alignments/

for i in `ls Sample*/*bam | sed 's/_sorted.bam//'`
  do
      echo ""
      echo ">>>>>>>>>>>>>>>>>>>> $i Variant Calling begun <<<<<<<<<<<<<<<<<<<<<<"
      echo ""
      freebayes -f ../ST5019G_1.fasta $i\_sorted.bam \
      --min-supporting-allele-qsum 0 \
      --min-base-quality 0 \
      --read-mismatch-limit 10 \
      --min-coverage 0 \
      --min-alternate-count 1 \
      --report-genotype-likelihood-max \
      --genotype-qualities \
      --ploidy 2 \
      --min-alternate-fraction 0.05 \
      --targets ../NGS1221_ST5019G_2_targets.bed \
      -X \
      --report-monomorphic \
      --mismatch-base-quality-threshold 10 \
      > $i\_RAW_V2.vcf
      echo ""
      echo ">>>>>>>>>>>>>>>>>>> $i Variant Calling Complete <<<<<<<<<<<<<<<<<<<<"
      echo ""
    done

printf "VCF Original Param Output Complete" | mail -s "VCF Output Complete" a.paterson@bristol.ac.uk
