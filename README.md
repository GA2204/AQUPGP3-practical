# AQUPGP3 Genomics Practical – Binder Environment

This repository contains the code and configuration needed to run the AQUPGP3
genomics practical entirely in the cloud using Binder.

## Launch Binder (RStudio)

Click below to open RStudio in your browser:

[![unch Binder

---

## Uploading Data Files

The data files for this practical are **not included in this repository**.
They are provided privately via Canvas.

Before running the script:

1. Download the two data files from Canvas.
2. In Binder RStudio, open the **Files** pane.
3. Click **Upload**.
4. Upload:
   - `AQUPGP3_GBS_SNP_mapping.csv`
   - `AQUPGP3_sample_pop.csv`
5. Open the script in the `scripts` folder.
6. Run the code step by step.

---

## Packages

All required packages are pre-installed by Binder, including:

- dartR.base
- dartRverse
- SNPRelate
- snpStats
- tidyverse

No installation is needed during the practical.

---

## Repository Structure 
AQUPGP3-practical/
│
├── install.R
├── runtime.txt
├── README.md
└── scripts/
└── AQUPGP3_practical.R

---
## Notes

This environment is temporary.  
Anything saved inside Binder will be lost when you close the session.  
**Download your output files if you want to keep them.**
