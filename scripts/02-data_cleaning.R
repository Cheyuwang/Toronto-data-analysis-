library(tidyverse)
library(janitor)
library(lubridate)
# Load the data and show the column names
voting_record <- read_csv("input/data/unprocessed_voting_record.csv")
colnames(voting_record)

# Clean and transform the data
# (Replace 'date_column' and 'other_columns' with actual column names from your dataset)
voting_record_clean <- 
  voting_record %>%
  clean_names() 

# Display the cleaned data
head(voting_record_clean)


write_csv(
  x = voting_record_clean,
  file = "outputs/data/processed_voting_record_clean.csv"
) 