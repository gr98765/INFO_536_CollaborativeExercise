# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the dataset
gtd_data <- read.csv("C:/Users/gaur/INFO-536/globalterrorismdb_0718dist.csv", stringsAsFactors = FALSE)


#select 'country_txt' and 'n_kill' columns, drops rows which consist NA

cleaned_data <- gtd_data %>%
  select(country_txt, nkill) %>%
na.omit()

# Basic data exploration
glimpse(cleaned_data)
