#!/bin/bash
conda run -n bioinformatics spades.py \
    -1 /voletu/users/echiarui/assignment/sample_data/HS7_R1.fastq.gz \
    -2 /voletu/users/echiarui/assignment/sample_data/HS7_R2.fastq.gz \
    --pacbio /voletu/users/echiarui/assignment/sample_data/HS7_pacbioData.fastq.gz \
    -o HS7_spades \
-t 4

