here::i_am("code/03_Age_Distribution.R")

# Load packages
library(ggplot2)

# Load data
cancer_data <- read.delim("data/cancer patient data sets.csv",sep=",")

# Plot Figure for Age distribution
figure1 <- ggplot(cancer_data, aes(x = Age)) + 
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Age Distribution of Patients", x = "Age", y = "Count")

ggsave(
  here::here("output/Age_Distribution.png"),
  plot = figure1,
  device = "png"
)
