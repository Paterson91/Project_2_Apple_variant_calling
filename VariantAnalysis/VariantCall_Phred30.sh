#!/bin/bash

cd /home/data/Alex/Apples/Alignments/

for i in `ls Sample*/*bam | sed 's/_sorted.bam//'`
  do
      echo ""
      echo ">>>>>>>>>>>>>>>>>>>> $i Variant Calling begun <<<<<<<<<<<<<<<<<<<<<<"
      echo ""
      freebayes -f ../ST5019G_1.fasta $i\_sorted.bam \
      --ploidy 2 \
      --targets ../NGS1221_ST5019G_2_targets.bed \
      | vcffilter -f "QUAL > 30" > $i\_Phred30.vcf
      echo ""
      echo ">>>>>>>>>>>>>>>>>>> $i Variant Calling Complete <<<<<<<<<<<<<<<<<<<<"
      echo ""
    done

printf "VCF Phred30 Output Complete" | mail -s "VCF Output Complete" a.paterson@bristol.ac.uk
