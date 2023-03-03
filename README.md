# RNA Seq Analysis
Bulk and single cell RNA-seq data analysis using open-source software and the R/bioconductor environment.

## Environments
There are 4 types of *_environment.yml files in this repository:
- **rnaseq_environment.yml**: Main environment (containing kallisto, fastqc & multiqc) to run bulk RNASeq (map raw reads, quality check the reads & summarize outputs)
- **kb_environment.yml**: Kallisto-Bustools (in Python) for single-cell RNASeq preprocessing
- **sourmash_environment.yml**: Sourmash to create and analyze sketches of HTS data for metagenomics
- **centrifuge_environment.yml**: ___ for metagenomics 
You can create each type through the following command: `conda env create --file [environment_file]`

## Dataset
- RNAseq dataset from skin biopsies obtained from patients with cutaneous leishmaniasis, a parasitic disease endemic in Brazil and other areas of South America. It contains data for 5 diseased & 5 control patients.
    - These files are too big for Git; you can download them to your local machine by clicking on the following link: https://drive.google.com/drive/folders/1sEk1od1MJKLjqyCExYyfHc0n7DAIy_x7 or use your own!
    - Place them in the `data/raw` folder.
    - They can be kept in the gzipped format.
- Study design
- Human reference transcriptome from Ensembl
    - Download the latest Homo sapiens cDNA from here: https://useast.ensembl.org/info/data/ftp/index.html
    - Place the file in the `data/reference` folder.

## Analysis Steps
Through the command line:
1. Activate the rnaseq environment: `conda activate rnaseq`
2. Run `. src/quality_control.sh` to check the quality of the fastq files. The results (1 HTML and 1 fastqc file for each fastq sample) will be stored in `data/quality_control`. You can open the HTML files in your browser to view each sample's FastQC report: ![fastqc](/supporting_figures/fastqc_report.png?raw=true "FastQC Report")
3. Run `. src/build_index.sh` to build an index from the reference Human fasta file. The resulting index file will be stored in `data/reference`.
4. Run `. src/mapping.sh` to the map the reads (single-end data) onto the reference transcriptome. Results (including logs) will be stored in `data/mapping`.
5. Run `multiqc -d data` to summarize the FastQC and Kallisto outputs in a single summary HTML using MultiQC. It will generate 1 summary HTML and 1 folder. The summary will ressemble this: ![multiqc](/supporting_figures/multiqc_report.png?raw=true "MultiQC Report")

 