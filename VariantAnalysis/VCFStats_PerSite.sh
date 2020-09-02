#!/bin/bash

#Script to pull out Variants per site OR per Variety

cd /home/data/Alex/Apples/Alignments/

echo -e "Name\tTotal SNP Count\tSNPs Per Site" >Unfiltered_SNP_Count.txt

for i in `ls Sample*/*bam | xargs -n 1 basename | sed 's/_sorted.bam//'`
  do
    NAME=$i
    TOTALSITES=1500
    SNPCOUNT=$(vcfstats Sample_$i\/$i\_OriginalParam.vcf | grep -m 1 snps: | cut -f 2)
    PERSITE=$(echo "scale=2 ; $SNPCOUNT / $TOTALSITES" | bc)
    echo -e $NAME'\t'$SNPCOUNT'\t'$PERSITE >>Unfiltered_SNP_Count.txt
  done
