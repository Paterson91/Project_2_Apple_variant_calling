#!/bin/bash

for i in `ls Sample*/*bam | sed 's/_sorted.bam//'`
  do
    echo ""
    echo ">>>>>>>>>>>>>>>>>>>> $i Conversion begun <<<<<<<<<<<<<<<<<<<<<<"
    echo ""
    bgzip -c $i\_OriginalParam.vcf > $i\_OriginalParam.vcf.gz
    bgzip -c $i\_Phred20.vcf > $i\_Phred20.vcf.gz
    bgzip -c $i\_Phred30.vcf > $i\_Phred30.vcf.gz
    tabix -p vcf $i\_OriginalParam.vcf.gz
    tabix -p vcf $i\_Phred20.vcf.gz
    tabix -p vcf $i\_Phred30.vcf.gz
    echo ""
    echo ">>>>>>>>>>>>>>>>>>>> $i Conversion Finished <<<<<<<<<<<<<<<<<<<<<<"
    echo ""
  done
