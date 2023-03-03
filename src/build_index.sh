#!/bin/sh

# Run this file using "sh build_index.sh"

index_file="Homo_sapiens.GRCh38.cdna.all.index"

# Build index of reference transcriptome
# Command: kallisto index -i [index_name] [path/to/reference_file]
kallisto index -i ${index_file} data/reference/Homo_sapiens.GRCh38.cdna.all.fa

# Move reference file to 'data/reference/' directory
mkdir data/reference
mv ${index_file} data/reference