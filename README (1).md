
# Microarray Experiment Overview

This repository documents a microarray experiment conducted on a glass slide as a medium for gene expression analysis. The microarray slides contain spots filled with short oligonucleotide sequences (probes) that are complementary to the cDNA of the sample.

## Glass Slide Construction

- **Company:** Affymetrix manufactures the glass slides.
- **Spots:** The spots on the glass slide contain short oligonucleotide probes.
- **Purpose:** These probes are used to measure gene expression levels in a sample.

## Signal Value

The signal value in a microarray experiment indicates the level of gene expression:

- **Higher signal value → Higher fluorescence → Higher gene expression**

## Techniques to Measure Gene Expression

### 1. Polymerase Chain Reaction (PCR)
- Measures the expression of one or a few genes at a time.
- **Primers:** Short oligonucleotide sequences (18-23 bp).

### 2. Microarray
- Measures the expression of thousands of genes simultaneously.
- **Probes:** 40-70 bp in length.
- Requires prior information about the genes being studied.

### 3. Next-Generation Sequencing (NGS)
- **Baits:** Up to 120 bp in length.
- Used for targeted resequencing.

> All primers, baits, and probes in these techniques are designed using the Tiling algorithm.

## Array Format

The choice of array format depends on the number of samples and features. For example:

- **8*15K Format:** 
    - 8 samples.
    - Each sample contains 15,000 features (spots).
    - Empty spots can be filled with probes of replicates.

## Steps of a Microarray Experiment

### 1. Probe Designing (Bioinformatics)
- Designing probes is the first step and involves bioinformatics.
- The process takes 3-4 months to complete.
- [Steps of Probe Designing](https://www.notion.so/Steps-of-probe-designing-81dac7fce9ac45dfb5a167f20485d77f?pvs=21)

### 2. Hybridization (Wet Lab Technique)
- **Control:** Cy3 (Green)
- **Treated:** Cy5 (Red)
- In this process, labeled cDNA binds to the probes on the glass slide. 
- After hybridization, the glass slide is sent for image analysis.

### 3. Data Analysis (Bioinformatics)
- Data from the experiment is stored in `.CEL` files (binary format).
- **Software:** R and RStudio are used for data analysis.
- Affymetrix data is also provided in `.CEL` format.

## License

This repository is licensed under the MIT License.
