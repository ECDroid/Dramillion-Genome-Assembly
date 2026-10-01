#!/bin/bash
# Defining variables
R1="/voletu/users/echiarui/assignment/sample_data/HS7_R1.fastq.gz"
R2="/voletu/users/echiarui/assignment/sample_data/HS7_R2.fastq.gz"

# Running Spades on Paired End reads
conda run -n bioinformatics spades.py \
    -1 ${R1} \
    -2 ${R2} \
    -o spades_assembly \
    -t 4

