# AQUPGP3 Practical – R Script for Students
# ------------------------------------------
# IMPORTANT:
# 1. Before running this script, upload the two data files into Binder:
#      - AQUPGP3_GBS_SNP_mapping.csv
#      - AQUPGP3_sample_pop.csv
#    Use the RStudio "Files" pane → Upload.
#
# 2. No package installation is needed. All packages are pre-installed in Binder.
#
# ------------------------------------------

# Load required libraries
library(dartR.base)
library(dartRverse)
library(SNPRelate)
library(snpStats)
library(tidyverse)

# Set working directory to the Binder project root
setwd(".")
dir()   # Check that your uploaded data files are shown

# ------------------------------------------------------------------
# READ DATA
# ------------------------------------------------------------------

# Create a genlight object from the dart data
gl <- gl.read.dart(
  filename = "AQUPGP3_GBS_SNP_mapping.csv",
  ind.metafile = "AQUPGP3_sample_pop.csv"
)

# Save and reload the genlight object
saveRDS(gl, file = "gl.Rdata")
gl <- readRDS("gl.Rdata")

# Quick check
ls()
gl
glimpse(gl)
gl.compliance.check(gl)

# See available metrics
names(gl@other$loc.metrics)

# ------------------------------------------------------------------
# BASIC DATA SUMMARY
# ------------------------------------------------------------------

nLoc(gl)
nInd(gl)
indNames(gl)
nPop(gl)
popNames(gl)
pop(gl)
as.matrix(gl)[1:10, 1:5]

# ------------------------------------------------------------------
# SNP FILTRATION STEPS
# ------------------------------------------------------------------

# 1. Reproducibility filter
gl.report.reproducibility(gl)
gl_flt <- gl.filter.reproducibility(gl, threshold = 0.95)

# 2. Call rate filter
gl.report.callrate(gl_flt)
gl_flt <- gl.filter.callrate(gl_flt, threshold = 0.80)

# 3. Minor allele frequency filter
gl.report.maf(gl_flt)
gl_flt <- gl.filter.maf(gl_flt, threshold = 0.05)

# ------------------------------------------------------------------
# VISUALISATION
# ------------------------------------------------------------------

custom_colors <- c("yellow", "red", "blue")
glPlot(gl_flt, col = custom_colors)

# ------------------------------------------------------------------
# POPULATION GENETICS ANALYSES
# ------------------------------------------------------------------

# Fst analysis
dfst <- gl.fst.pop(gl_flt)
dfst

# PCA
pca <- gl.pcoa(gl_flt)

# PCA plots
gl.pcoa.plot(pca, gl_flt)
gl.pcoa.plot(pca, gl_flt, xaxis = 1, yaxis = 3)

# Heterozygosity / inbreeding coefficients
inbr <- gl.report.heterozygosity(gl_flt)
inbr

# ------------------------------------------------------------------
# SAVE SESSION
# ------------------------------------------------------------------

save.image(file = "AQUPGP3_practical.RData")
