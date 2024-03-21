# Load required packages
library(ggplot2)
library(plotly)
library(dplyr)
library(htmlwidgets)

# Read in the data
data <- read.csv("~/Downloads/Alzheimer_Disease_Healthy_Aging_Data.csv")

# Create the required figures
p <- ggplot(data, aes(x = as.factor(YearStart), fill = Class)) +
  geom_bar(position = "dodge") +
  labs(title = "Distribution of 'Class' Across Years",
       x = "Year",
       y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1),
        legend.position = "bottom") +
  guides(fill = guide_legend(title = "Class"))

interactive_plot1 <- ggplotly(p)


# Save the interactive plot as an HTML file
htmlwidgets::saveWidget(interactive_plot1, "report/interactive_plot.html")
