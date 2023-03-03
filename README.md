# RNA Seq Analysis
Bulk and single cell RNA-seq data analysis using open-source software and the R/bioconductor environment.

## Environments
There are 3 types of *_environment.yml files in this repository:
- rnaseq_environment: Main environment (containing kallisto, fastqc & multiqc) to run bulk RNASeq (map raw reads, quality check the reads & summarize outputs)
- kb_environment: Kallisto-Bustools (in Python) for single-cell RNASeq preprocessing
- sourmash_environment: Sourmash to create and analyze sketches of HTS data for metagenomics
- centrifuge_environment: ___ for metagenomics 

## Dataset
- RNAseq dataset from skin biopsies obtained from patients with cutaneous leishmaniasis, a parasitic disease endemic in Brazil and other areas of South America. It contains data for 5 diseased & 5 control patients.
    - These files are too big for Git; you can download them to your local machine by clicking on the following link: https://drive.google.com/drive/folders/1sEk1od1MJKLjqyCExYyfHc0n7DAIy_x7
- Study design
- Human reference transcriptome from Ensembl
    - Download the latest Homo sapiens cDNA from here: https://useast.ensembl.org/info/data/ftp/index.html

## Steps
1. Activate the rnaseq environment: `conda activate rnaseq`
2. Run `. src/run_fastqc.sh` to perform quality assessment of fastqc files. These will create one HTML and one fastqc file for each fastq sample.
3. You can open the HTML files in your browser to view each sample's FastQC report: ![fastqc](/supporting_figures/fastqc_report.png?raw=true "FastQC Report")
4. Use Kallisto to build an index from the reference fasta: `kallisto index -i Homo_sapiens.GRCh38.cdna.all.index data/Homo_sapiens.GRCh38.cdna.all.fa`
 