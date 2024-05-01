here::i_am("code/02_Regression_Model.R")

# Load packages
library(dplyr)
library(broom)
library(kableExtra)

# Load data
cancer_data <- read.delim("data/cancer patient data sets.csv",sep=",")

# Fit regression model
model <- lm(chronic.Lung.Disease ~ Age + Gender + Air.Pollution + Smoking + Obesity, data = cancer_data)

# Arrange outcome
model_summary <- tidy(model)

# show table
table2 <- kable(model_summary, format = "html", caption = "Regression Analysis Summary") %>%
  kable_styling(bootstrap_options = c("striped", "hover"), full_width = F)

saveRDS(
  table2,
  file = here::here("output/Regression_Model_Table.rds")
)