#### Preamble ####
# Purpose: Data of members of Toronto City Council - Voting Record
# Author: Che-Yu Wang
# Email: cheyu.wang@mail.utoronto.ca
# Date: Jan 21st 2022 
# Prerequisites: organized the data 

#### Workspace setup ####
install.packages("knitr")
install.packages("janitor")
install.packages("tidyverse")
library(knitr)
library(janitor)
library(lubridate)
library(tidyverse)

install.packages("usethis")
library(usethis)
create_github_token()

install.packages("gitcreds")
library("gitcreds")
gitcreds_set()

library(readr)
member_voting_record_2018_2022 <- read_csv("member-voting-record-2018-2022.csv")
View(member_voting_record_2018_2022)

#### Simulate Council Voting Data ####
set.seed(853)

# Adjusting the number of council members
#Sorces : https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html 

num_members = 10

simulated_voting_data <- 
  tibble(
    date = rep(as.Date("2021-01-01") + c(0:364), times = num_members), # Repeat each date for each council member
    council_member = rep(c(
      "Member 1",
      "Member 2",
      "Member 3",
      "Member 4",
      "Member 5",
      "Member 6",
      "Member 7",
      "Member 8",
      "Member 9",
      "Member 10"
    ), each = 365), # Repeat each member's name for each day of the year
    vote = sample(c("Yes", "No", "Abstain"), 365 * num_members, replace = TRUE) # Randomly assign votes
  )

head(simulated_voting_data)


#### Acquire #### 
library(tidyverse)

# data sources 2.3.3 https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html 

# we will regenerate the data set by each persons voting results 
voting_record <- read_csv("member-voting-record-2018-2022.csv")

write_csv(
  x = voting_record,
  file = "processed_voting_record.csv"
)

# Viewing the first few rows of the dataset
head(voting_record)



library(tidyverse)
library(janitor)
library(lubridate)

# Load the data and show the column names
voting_record <- read_csv("member-voting-record-2018-2022.csv")
colnames(voting_record)

# Clean and transform the data
# (Replace 'date_column' and 'other_columns' with actual column names from your dataset)
voting_record_clean <- 
  voting_record %>%
  clean_names() 
  
  # Display the cleaned data
head(voting_record_clean)


write_csv(
  x = voting_record,
  file = "processed_voting_record_clean.csv"
) 








