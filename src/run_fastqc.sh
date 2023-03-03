#!/bin/sh

# Run this file using "sh run_fastqc.sjh"

# Perform quality assessment of fastq files using 'fastqc'
# Command: fastqc [filename.fastq.gz]
fastqc data/*.fastq.gz -t 8