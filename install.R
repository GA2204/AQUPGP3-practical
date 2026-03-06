options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install Bioconductor manager
install.packages("BiocManager")

# Bioconductor packages needed for dartR dependencies
BiocManager::install(c("snpStats", "SNPRelate"), update = FALSE, ask = FALSE)

# Install key CRAN packages
install.packages(c(
  "dartR.base",
  "dartRverse",
  "directlabels"
  ), dependencies = TRUE)
