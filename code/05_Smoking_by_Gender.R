here::i_am("code/05_Smoking_by_Gender.R")

# Load packages
library(ggplot2)

# Load data
cancer_data <- read.delim("data/cancer patient data sets.csv",sep=",")

# Plot Figure for Chronic Lung Cancer by Age
figure3 <- ggplot(cancer_data, aes(y = Smoking, x = as.factor(Gender))) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  theme_minimal() +
  labs(title = "Smoking by Gender", x = "Gender", y = "Smoking Level")

ggsave(
  here::here("output/Smoking_by_Gender.png"),
  plot = figure3,
  device = "png"
)