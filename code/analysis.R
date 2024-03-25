# Load required packages
library(dplyr)
library(ggplot2)
library(table1)
library(tidyverse)
library(readxl)
library(writexl)
library(car)
library(readr)
library(kableExtra)
library(plotly)

# Read in the data
data <- read.csv("~/Desktop/550/Alzheimer_Disease_Healthy_Aging_Data.csv")

# Perform data preprocessing and analysis
overall_stats <- tibble(
  Total_Respondents = nrow(data),
  Avgerage = mean(data$Data_Value, na.rm = TRUE),
  SD = sd(data$Data_Value, na.rm = TRUE),
  Median = median(data$Data_Value, na.rm = TRUE),
  IQR = IQR(data$Data_Value, na.rm = TRUE)
)

# Create the required tables
gender_breakdown <- data %>%
  filter(!is.na(Gender)) %>%
  count(Gender) %>%
  mutate(Percentage = n / sum(n) * 100) %>%
  rename(Total_Respondents = n, Category = Gender)

ethnicity_breakdown <- data %>%
  filter(!is.na(Ethnicity)) %>%
  count(Ethnicity) %>%
  mutate(Percentage = n / sum(n) * 100) %>%
  rename(Total_Respondents = n, Category = Ethnicity)

categorical_breakdown <- bind_rows(gender_breakdown, ethnicity_breakdown)

# Save the overall_stats and categorical_breakdown data frames to files
saveRDS(overall_stats, "~/Desktop/550/report/overall_stats.rds")
saveRDS(categorical_breakdown, "~/Desktop/550/report/categorical_breakdown.rds")

# Generate the final report
rmarkdown::render("~/Desktop/550/report/report.Rmd", output_format = "html_document")
