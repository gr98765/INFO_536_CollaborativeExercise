# Global Terrorism Database Collaborative Analysis

# Calculate total fatalities per region
fatalities_per_region <- cleaned_data %>%
  group_by(country_txt) %>%
  summarise(total_fatalities = sum(nkill))

# View the results
glimpse(fatalities_per_region)
