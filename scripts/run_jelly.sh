#!/bin/bash
# Defining Variables
R1="/voletu/users/echiarui/assignment/sample_data/HS7_R1.fastq.gz"
R2="/voletu/users/echiarui/assignment/sample_data/HS7_R2.fastq.gz"
out_dir="/voletu/users/echiarui/assignment/QC_analysis"

# Code to run Jellyfish to find genome size from the kmer spectrum produced
zcat "$R1" "$R2" | conda run -n bioinformatics jellyfish count \
-t 2 \
-C \
-m 19 \
-s 1G \
-o "${out_dir}/R12corr_19mer_out"

conda run -n bioinformatics jellyfish histo \
-o "${out_dir}/R12_19mer.histo" \
"${out_dir}/R12corr_19mer_out"

