#!/bin/sh

# Run this file using "sh run_fastqc.sh"

# Perform quality assessment of fastq files using 'fastqc'
# Command: fastqc [filename] -r [n_cores]
fastqc data/*.fastq.gz -t 4

# Move outputs to its own individual folder: data/quality_control
mkdir -p data/quality_control
mv data/*.html data/quality_control
mv data/*.zip data/quality_control