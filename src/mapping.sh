#!/bin/sh

# Run this file using "sh alignment.sh"

# Create output folder (if it doesn't already exist)
mkdir -p data/mapping

# Iterate over each fastq file
for FASTQ_FILE in data/raw/*; do 
    echo "Mapping single-end data for ${FASTQ_FILE}...";

    # Retrieve sample name (for folder & log names)
    SAMPLE=$(echo ${FASTQ_FILE} | cut -d "." -f 1);
    SAMPLE=$(echo ${SAMPLE} | cut -d "/" -f 3);

    # Run mapping command: kallisto quant -i [index_file] -o [output_folder] -t [n_threads] \
    # --single -l [avg_length_nucleotides] -s [avg_stdev_nucleotides] [path/to/fastq_file]
    kallisto quant \
        -i data/reference/Homo_sapiens.GRCh38.cdna.all.index \
        -o data/mapping/${SAMPLE} \
        -t 2 \
        --single \
        -l 250 \
        -s 30 \
        ${FASTQ_FILE} \
        &> data/mapping/${SAMPLE}.log;

    echo "-> Mapped ${SAMPLE} to reference.";
done

echo "Done mapping all samples to reference."