#!/bin/bash
# Defining Variables
SR="/voletu/users/echiarui/assignment/test3/spades_SR/spades_assembly/contigs.fasta"
LR="/voletu/users/echiarui/assignment/sample_data/HS7_pacbioData.fastq"
conda run -n bioinformatics DBG2OLC \
LD1 0 \
Contigs "$SR" \
k 17 \
AdaptiveTh 0.0001 \
KmerCovTh 2 \
MinOverlap 20 \
RemoveChimera 1 \
f "$LR"

