# Excersice

# Question 1

library(tidycensus)

median_age_urban <- get_acs(geography= 'urban area',
                            variables= 'B01002_001',
                            year= 2019)

# Question 2

v10 <- load_variables(year = 2019, dataset = "acs5")


white<- get_acs(geography='county',
                variables='B02008_001',
                state='NY',
                year=2019)
