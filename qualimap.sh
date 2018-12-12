#!/bin/bash

ALIGNED_DATA="/mnt/home1/bioinfo/ks765/xxx/aligned_data_mm9"

for file in $ALIGNED_DATA/*.sorted.bam
do
        outfile=$(basename "$file")
        outfile=${outfile%.sorted.bam}
	/mnt/b2/home1/bioinfo/ks765/qualimap_v2.2.1/qualimap bamqc -bam $file -c -outformat PDF -outfile $outfile.pdf

done
