options(repos = c(CRAN = "https://cloud.r-project.org"))

# Install Bioconductor manager
install.packages("BiocManager")

# Bioconductor packages needed for dartR dependencies
BiocManager::install(c("snpStats", "SNPRelate"), update = FALSE, ask = FALSE)

# Install key CRAN packages
install.packages(c(
  "dartR.base",
  "dartRverse",
  "directlabels",
  "tidyverse"
), dependencies = TRUE)


# Install IRkernel so R appears as a kernel in JupyterLab
install.packages("IRkernel")
IRkernel::installspec(user = FALSE)
