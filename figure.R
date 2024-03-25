# Load required packages
library(ggplot2)
library(plotly)
library(dplyr)
library(htmlwidgets)

# Read in the data
data <- read.csv("~/Desktop/550/Alzheimer_Disease_Healthy_Aging_Data.csv")

# Create the required figure
p <- ggplot(data, aes(x = as.factor(YearStart), fill = Class)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribution of 'Class' Across Years",
       x = "Year",
       y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        legend.position = "bottom") +
  guides(fill = guide_legend(title = "Class"))

# Save the plot as a static image file
ggsave("~/Desktop/550/report/plot.png", plot = p, width = 8, height = 6, dpi = 300)
