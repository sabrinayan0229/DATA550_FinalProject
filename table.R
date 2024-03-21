# Load required packages
library(dplyr)
library(kableExtra)

# Read in the data
data <- read.csv("~/Downloads/Alzheimer_Disease_Healthy_Aging_Data.csv")

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

# Save the categorical_breakdown data frame to a file
saveRDS(categorical_breakdown, "report/categorical_breakdown.rds")