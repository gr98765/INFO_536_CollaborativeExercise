# Role 3: Devashree Pawar
# Visualize fatalities by region using a bar chart.

# Create a bar plot for fatalities per region
ggplot(fatalities_per_region, aes(y = reorder(country_txt, total_fatalities), x = total_fatalities)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Total Fatalities per Region",
       x = "Total Fatalities",
       y = "Region") +
  theme(axis.text.y = element_text(size = 8))  # Adjust label size if needed

# Since the countries in the above bar plot are clustered one over other so, I tried to show only the top 20 countries in the plot.
# Select top 20 countries based on total fatalities
top_20_countries <- fatalities_per_region %>%
  top_n(20, total_fatalities) %>%  # Select top 20
  arrange(desc(total_fatalities))  # Arrange in descending order

# Create a bar plot for top 20 countries
ggplot(top_20_countries, aes(x = total_fatalities, y = reorder(country_txt, total_fatalities))) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.7) +  # Adjust bar width if needed
  theme_minimal() +  # Minimal theme
  labs(title = "Top 20 Countries by Total Fatalities",
       x = "Total Fatalities",
       y = "Country") +
  theme(axis.text.y = element_text(size = 8),  # Adjust country label size if necessary
        panel.grid.minor = element_blank(),    # Remove minor grid lines
        panel.grid.major.y = element_blank())  # Remove horizontal grid lines

# Creating tree map for better visualization than bar plot.
# Load the treemapify package 
library(treemapify)
# Treemap plot
ggplot(fatalities_per_region, aes(area = total_fatalities, fill = total_fatalities, label = country_txt)) +
  geom_treemap() +
  geom_treemap_text(colour = "white", place = "centre", grow = TRUE) +
  scale_fill_gradient(low = "lightblue", high = "steelblue") +
  theme_minimal() +
  labs(title = "Total Fatalities per Region (Treemap)")
