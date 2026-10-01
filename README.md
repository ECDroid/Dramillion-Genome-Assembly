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

This project used `conda` for environment management. Follow the instructions below to Install Conda (if not already installed) and create the respective conda envrionments needed.

### Install Conda
If you do not have conda installed, follow the official installation guide: [Miniconda Installation](https://docs.conda.io/en/latest/miniconda.html).

### Create Conda Environments
As per the analysis, several bioinformatics tools are required. The following commands create a separate, unique conda environment for each tool to prevent dependency conflicts.

**Jellyfish (for k-mer analysis)**
```bash
conda create -n jellyfish -c bioconda jellyfish
```
**SPAdes (for HybridSPAdes and DBG2OLC pre-assembly)**
```bash
conda create -n spades -c bioconda spades
```
**MaSuRCA (for MaSuRCA assembly)**
```bash
conda create -n masurca -c bioconda masurca
```
**DBG2OLC (for DBG2OLC assembly)**
```bash
conda create -n dbg2olc -c bioconda dbg2olc
```
**Pilon (for assembly polishing)**
```bash
conda create -n pilon -c bioconda pilon bwa samtools
```
**Quast (for assembly statistics)**
```bash
conda create -n quast -c bioconda quast
```
**Merqury (for k-mer based evaluation)**
```bash
conda create -n merqury -c bioconda merqury meryl
```
**FastQC (for read quality control)**
```bash
conda create -n fastqc -c bioconda fastqc
```

### Usage
The following section details the commands used to run the analysis. Activate the appropriate conda environment before running each step. The actual scripts are located in the /scripts directory of this repository.

#### Quality Control
Activate the `jellyfish` and `fastqc` environments.
```bash
conda activate jellyfish
bash scripts/run_jellyfish.sh
```

#### Genome Assembly
Activate the corresponding environment for each assembler.

**MaSuRCA:**
```bash
conda activate masurca
bash scripts/run_masurca.sh
```
**HybridSPAdes:**
```bash
conda activate spades
bash scripts/run_hybridspades.sh
```
**DBG2OLC:**
```bash
# First, run SPAdes for short-read contigs
conda activate spades
bash scripts/run_spades_for_dbg2olc.sh

# Then, run DBG2OLC
conda activate dbg2olc
bash scripts/run_dbg2olc.sh
```
#### Assembly Polishing
Activate the `pilon` environment. This step needs to be repeated for each of the three assemblies.
```bash
conda activate pilon
bash scripts/run_pilon.sh path/to/assembly.fasta
```
#### Quality Assessment
Activate the `quast` and `merqury` environments.

**Quast:**
```bash
conda activate quast
quast.py path/to/assembly1.fasta path/to/assembly2.fasta -o quast_results
```
**Merqury:**
```bash
conda activate merqury
bash scripts/run_merqury.sh path/to/assembly.fasta
```
### Results and Conclusion
**MaSuRCA** was chosen as the best assembler for this dataset.

**Contiguity**: MaSuRCA produced the assembly with the highest N50 value (159,039 bp) and the longest contig (367,974 bp).

**Accuracy**: The assembly had zero ambiguous bases (N's) per 100 kbp.

**Completeness**: Merqury analysis showed a completeness score of 97.59%, which was highly competitive and indicated very few missing k-mers from the original reads.

Although HybridSPAdes had a slightly higher completeness score (97.74%), its assembly was more fragmented (lower N50) and contained ambiguous bases. DBG2OLC produced a much shorter and less complete assembly. Therefore, MaSuRCA provided the best balance of contiguity, accuracy, and completeness for this genome.




