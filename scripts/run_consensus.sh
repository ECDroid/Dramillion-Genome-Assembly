#!/bin/bash
# Defining Variables
SR="/voletu/users/echiarui/assignment/test3/spades_SR/spades_assembly/contigs.fasta"
LR="/voletu/users/echiarui/assignment/sample_data/HS7_pacbioData.fasta"
base="/voletu/users/echiarui/assignment/test3"

# Code to call the consensus information from DBG2OLC
cat "$SR" "$LR" > ${base}/ctg_pb.fasta

conda run -n py2 split_and_run_sparc.sh \
    "${base}/backbone_raw.fasta" \
    "${base}/DBG2OLC_Consensus_info.txt" \
    "${base}/ctg_pb.fasta" \
    "${base}/consensusOUT"

