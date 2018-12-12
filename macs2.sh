#!/bin/bash

while IFS=$'\t' read -r f1 f2
do
	echo $f1
	echo $f2
	treatment=${f2%.sorted.bam}
	control=${f1%.sorted.bam}
	macs2 callpeak -t $f2 -c $f1 --broad -n $treatment-$control -g 1.87e9 --broad-cutoff 0.1 --nomodel --extsize 330
done < $1

