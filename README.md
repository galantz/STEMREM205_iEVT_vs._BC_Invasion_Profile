# STEMREM iEVT vs. Breast Cancer Comparison

# Trophoblast Invasion Programs in Breast Cancer

This project analyzes transcriptional similarities between extravillous trophoblast (iEVT) invasion during placental development and tumor invasion in breast cancer using single-cell and spatial transcriptomics.

## Summary
Using published scRNA-seq and Visium HD spatial datasets, we identify gene programs associated with trophoblast invasion and test whether these programs appear in breast tumors. We find that invasion-related transcriptional signatures overlap strongly with breast cancer epithelial cells, particularly triple-negative breast cancer, and spatially localize to the nvasive tumor edge in invasive ductal carcinoma samples.

## Methods
Analysis performed in Python (Scanpy / AnnData) using:
- PCA and UMAP clustering
- differential gene expression
- GSEA and ORA pathway enrichment
- spatial transcriptomic scoring of invasion gene programs
- Jupyter Notebook / Google Colab as IDEs

## Key Finding
Developmental invasion programs used by trophoblasts appear to be repurposed by breast cancer cells during tumor invasion, particularly at the tumor–stroma interface.

## Data Sources
- Arutyunyan et al. 2023 – trophoblast spatial multiomics dataset  
- Wu et al. 2021 – breast cancer single-cell atlas  
- 10x Genomics Visium HD invasive ductal carcinoma dataset

## Authors
George Lantz  
Siena Nason  
Nadia Grishanina  
Stanford University – STEMREM 205

_Thank you!!!_
