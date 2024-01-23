#### Workspace setup ####
#install.packages("opendatatoronto")
#install.packages("knitr")

library(opendatatoronto)
library(tidyverse)

#### Acquire #### 
voting_record <-
  # Each package is associated with a unique id  found in the "For 
  # Developers" tab of the relevant page from Open Data Toronto
  # https://open.toronto.ca/dataset/members-of-toronto-city-council-voting-record/
  list_package_resources("7f5232d6-0d2a-4f95-864a-417cbf341cc4") |>
  # Within that package, we are interested in the 2021 dataset
  filter(name == 
           "member-voting-record-2018-2022") |>
  # Having reduced the dataset to one row we can get the resource
  get_resource()


write_csv(
  x = voting_record,
  file = "unprocessed_voting_record.csv"
)

# Viewing the first few rows of the dataset
head(voting_record)