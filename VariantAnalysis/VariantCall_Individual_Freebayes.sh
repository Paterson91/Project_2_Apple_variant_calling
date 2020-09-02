# My generation of global .vcf file - Unfiltered

#!/bin/bash

cd /home/data/Alex/Apples/Alignments/

for i in `ls Sample*/*bam | sed 's/_sorted.bam//'`
	do
		echo ""
		echo ">>>>>>>>>>>>>>>>>>>> $i Variant Calling begun <<<<<<<<<<<<<<<<<<<<<<"
		echo ""
		freebayes -f ../ST5019G_1.fasta $i\_sorted.bam > $i.vcf
		echo ""
		echo ">>>>>>>>>>>>>>>>>>> $i Variant Calling Complete <<<<<<<<<<<<<<<<<<<<"
		echo ""
	done

printf "VCF Output Complete" | mail -s "VCF Output Complete" a.paterson@bristol.ac.uk

# Merging VCF file

for i in `ls Sam*/*.vcf | sed 's/.vcf//'`
	do
    bgzip $i\.vcf; tabix -p vcf $i\.vcf.gz
	done

printf "bgzip complete" | mail -s "bgzip complete" a.paterson@bristol.ac.uk

vcf-merge $"(ls Sam*/*.vcf.gz)"" | bgzip -c > out.vcf.gz

printf "Merge complete" | mail -s "Merge complete" a.paterson@bristol.ac.uk







#APPROACH 1

# Filtering
#vcftools --vcf Apple-plate-1-A01-QC2226.vcf --minQ 20 --recode --recode-INFO-all --out Apple-plate-1-A01-QC2226_filtered
#vcftools --vcf Apple-plate-1-A02-L2269.vcf --minQ 20 --recode --recode-INFO-all --out Apple-plate-1-A02-L2269_filtered
# Merging files
#bgzip Apple-plate-1-A01-QC2226_filtered.recode.vcf; tabix -p vcf Apple-plate-1-A01-QC2226_filtered.recode.vcf.gz
#bgzip Apple-plate-1-A02-L2269_filtered.recode.vcf; tabix -p vcf Apple-plate-1-A02-L2269_filtered.recode.vcf.gz

#vcf-merge Apple-plate-1-A01-QC2226_filtered.recode.vcf.gz Apple-plate-1-A02-L2269_filtered.recode.vcf.gz | bgzip -c > filter_merge.vcf.gz
#vcf-merge A.vcf.gz B.vcf.gz C.vcf.gz | bgzip -c > out.vcf.gz

#APPROACH 2

# Merging files
#bgzip Apple-plate-1-A01-QC2226.vcf; tabix -p vcf Apple-plate-1-A01-QC2226.vcf.gz
#bgzip Apple-plate-1-A02-L2269.vcf; tabix -p vcf Apple-plate-1-A02-L2269.vcf.gz
#vcf-merge Apple-plate-1-A01-QC2226.vcf.gz Apple-plate-1-A02-L2269.vcf.gz | bgzip -c > merge_filter.vcf.gz
# Filtering
#vcftools --vcf merge_filter.vcf --minQ 20 --recode --recode-INFO-all --out merge_filter

# Converting to tab delimited

#vcf-to-tab < Apple-plate-1-A01-QC2226.vcf >Apple-plate-1-A01-QC2226.txt
