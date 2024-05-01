here::i_am("code/01_Summary_Statistics_Table.R")

# Load libraries
library(vtable)

# Load data
cancer_data <- read.delim("data/cancer patient data sets.csv",sep=",")

# Create and present summary statistics for numeric variables
table1 <- sumtable(cancer_data[,3:ncol(cancer_data)],out = 'return')

saveRDS(
  table1,
  file = here::here("output/Summary_Statistics_Table.rds")
)