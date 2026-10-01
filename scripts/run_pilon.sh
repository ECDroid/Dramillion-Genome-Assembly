#!/bin/bash
# Command to run pilon pipeline
conda run -n bioinformatics3 samtools sort HS7_aligns.bam -o HS7_alignsSorted.bam

conda run -n bioinformatics3 samtools index HS7_alignsSorted.bam

conda run -n bioinformatics3 pilon \
    --genome final_assembly.fasta \
    --frags HS7_alignsSorted.bam \
    --output HS7_piloned \
    --tracks

