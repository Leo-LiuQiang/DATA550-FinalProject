here::i_am("code/04_Gender_Distribution.R")

# Load packages
library(ggplot2)

# Load data
cancer_data <- read.delim("data/cancer patient data sets.csv",sep=",")

# Plot Figure for Gender distribution
figure2 <- ggplot(cancer_data, aes(y = Smoking, x = as.factor(Gender))) +
  geom_boxplot(fill = "lightgreen", color = "black") +
  theme_minimal() +
  labs(title = "Smoking by Gender", x = "Gender", y = "Smoking Level")

ggsave(
  here::here("output/Gender_Distribution.png"),
  plot = figure2,
  device = "png"
)