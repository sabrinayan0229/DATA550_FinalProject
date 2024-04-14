# Final Project Alzheimer's Disease Analysis
Welcome~~ 
This repository contains the code and data for analyzing Alzheimer's disease data. <br />

## Dataset

- Since it is a rather big dataset file, Github doesn't allow me to upload it straight in CVS format. <br />
I upload the first 250 rows dataset file, it might alter the result from the word summary. 

OR

- You can download it straight from the Kaggle website: <br />
https://www.kaggle.com/datasets/amitvkulkarni/aging-and-memory-alzheimers-statistics?resource=download

## Installation

To set up the R package environment, you need to restore the package state with `renv` to ensure reproducibility. Here’s how to do it:

1. Ensure you have R and `renv` installed on your system. If `renv` is not installed, you can install it by running `install.packages("renv")` in R.
2. Run the following command in the terminal within the project directory:

   ```bash
   make install
   ``` 

This command uses renv to install all necessary packages as specified in the renv.lock file. 

## Contents

- `data/`: Contains the dataset file `Alzheimers_Disease_Healthy_Aging_data.csv`.
- `code/`: Contains the R scripts for analysis, generating tables, and figures.
  - `analysis.R`: Main analysis script.
  - `table.R`: Script for generating the required table.
  - `figure.R`: Script for generating the required figure.
- `report/`: Contains the R Markdown file for the final report.
- `Makefile`: Contains rules for building the final report and managing dependencies with `renv`.

## Generating the Report

To generate the final report, follow these steps:

1. Clone the repository.
2. Open a terminal and navigate to the project directory.
3. Run the command `make all` to execute the analysis and generate the report.
4. The generated report will be saved as `report/report.html`.

## Table and Figure

- The code for creating the required table is located in `code/table.R`.
- The code for creating the required figure is located in `code/figure.R`.
