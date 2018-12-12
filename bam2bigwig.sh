#!/bin/bash

ALIGNED_DATA="/mnt/home1/bioinfo/ks765/xxx/aligned_data_mm9"

for file in $ALIGNED_DATA/*.sorted.bam
do
	outfile=$(basename "$file")
	outfile=${outfile%.sorted.bam}
	bamCoverage --bam $file --extendReads 330 --outFileName $ALIGNED_DATA/$outfile.bw
done
