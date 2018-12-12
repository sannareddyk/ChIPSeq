#!/bin/bash

#SBATCH -J bwa_mem
#SBATCH --mail-type=END
#SBATCH -N 1
#SBATCH -n 2
#SBATCH -t 0-48:00
#SBATCH -p xxx
#SBATCH --mail-user=xxx

REFERENCE_PATH="/mnt/b2/home1/bioinfo/ks765/mm9_reference/mm9.fa"
TRIMMED_DATA="/mnt/home1/bioinfo/ks765/xxx/fastq_trimmed"
ALIGNED_DATA="/mnt/home1/bioinfo/ks765/xxx/aligned_data_mm9"

for file in $TRIMMED_DATA/*_sickletrimmed_trimmed.fq.gz
do
	outfile=$(basename "$file")
	outfile=${outfile%_sickletrimmed_trimmed.fq.gz}
	outsam="$outfile.sam"
	outbam="$outfile.bam"
	outbamsorted="$outfile.sorted"

	bwa mem -t 2 -M $REFERENCE_PATH $file >$ALIGNED_DATA/$outsam

	##convert sam to bam, sort and index
	samtools view -bS -o $ALIGNED_DATA/$outbam $ALIGNED_DATA/$outsam
	samtools sort $ALIGNED_DATA/$outbam $ALIGNED_DATA/$outbamsorted
	samtools index $ALIGNED_DATA/$outbamsorted.bam

done
