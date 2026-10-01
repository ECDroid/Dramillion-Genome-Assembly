# Dramillion-Genome-Assembly
De novo genome assembly of an unknown organism using Illumina and PacBio reads. This project compares the use of three hybrid genome assemblers, namely: MaSuRCA, hybridSPAdes, and DBG2OLC

<p align="center">
  <img src="Dramillion.png" width="300" alt="Dramillion Genome Assembly Logo">
</p>

Three different hybrid assembly pipelines were evaluated:
1.  **MaSuRCA** (Maryland Super-Read Celera Assembler)
2.  **HybridSPAdes**
3.  **DBG2OLC** (with SPAdes for pre-assembly)

The final assemblies were polished with **Pilon**, and quality was assessed using **Quast** and **Merqury**.

## Table of Contents
- [Project Workflow](#project-workflow)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Results and Conclusion](#results-and-conclusion)

## Project Workflow
The analysis follows these main steps:
1.  **Quality Control (QC):** Raw Illumina reads were assessed using FastQC and k-mer analysis with Jellyfish.
2.  **De Novo Assembly:** Three parallel assembly strategies were employed.
3.  **Assembly Polishing:** All three draft assemblies were polished using Pilon with the original Illumina short reads to correct base-level errors.
4.  **Quality Assessment:** The final polished assemblies were evaluated for contiguity (N50, largest contig), completeness, and accuracy using Quast and Merqury.

## Setup and Installation

This project requires `conda` for environment management.

### 1. Install Conda
If you do not have conda installed, follow the official installation guide: [Miniconda Installation](https://docs.conda.io/en/latest/miniconda.html).

### 2. Create Unique Conda Environments
As per the analysis, several bioinformatics tools are required. The following commands create a separate, unique conda environment for each tool to prevent dependency conflicts.

**Jellyfish (for k-mer analysis)**
```bash
conda create -n jellyfish -c bioconda jellyfish

**SPAdes (for HybridSPAdes and DBG2OLC pre-assembly)**
conda create -n spades -c bioconda spades

**MaSuRCA (for MaSuRCA assembly)**
conda create -n masurca -c bioconda masurca

**DBG2OLC (for DBG2OLC assembly)**
conda create -n dbg2olc -c bioconda dbg2olc

**Pilon (for assembly polishing)**
conda create -n pilon -c bioconda pilon bwa samtools

**Quast (for assembly statistics)**
conda create -n quast -c bioconda quast

**Merqury (for k-mer based evaluation)**
conda create -n merqury -c bioconda merqury meryl

**FastQC (for read quality control)**
conda create -n fastqc -c bioconda fastqc
