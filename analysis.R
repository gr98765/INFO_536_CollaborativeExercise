# Global Terrorism Database Collaborative Analysis

# Load necessary libraries
library(dplyr)
library(ggplot2)

#Role 1: Gaurangi
# Load the dataset
gtd_data <- read.csv("C:/Users/gaur/INFO-536/globalterrorismdb_0718dist.csv", stringsAsFactors = FALSE)


#select 'country_txt' and 'n_kill' columns, drops rows which consist NA

cleaned_data <- gtd_data %>%
  select(country_txt, nkill) %>%
na.omit()

# Data exploration by region
glimpse(cleaned_data)

#Role 2 : Sreeharsha
# Group by region (or country) and calculate total fatalities
fatalities_per_region <- cleaned_data %>%
  group_by(country_txt) %>%
  summarise(total_fatalities = sum(nkill, na.rm = TRUE))

# View the data for graphing
glimpse(fatalities_per_region)

