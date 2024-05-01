here::i_am("code/06_Chronic_Lung_Cancer_by_Age.R")

# Load packages
library(ggplot2)

# Load data
cancer_data <- read.delim("data/cancer patient data sets.csv",sep=",")

# Plot Figure for Chronic Lung Cancer by Age
figure4 <- ggplot(cancer_data, aes(x = Age, y = chronic.Lung.Disease)) +
  geom_point(alpha = 0.6, color = "red") +
  theme_minimal() +
  labs(title = "Chronic Lung Disease by Age", x = "Age", y = "Chronic Lung Disease Level")

ggsave(
  here::here("output/Chronic_Lung_Cancer_by_Age.png"),
  plot = figure4,
  device = "png"
)