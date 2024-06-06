library('tidycensus')

# Get decennial survey data
total_population_20 <- get_decennial(geography='state', 
                                     variables='P001001',
                                     year=2010)


aian_2020<- get_decennial(geography='state',
                          variables='P1_005N',
                          year=2020,
                          sumfile='pl')

# Get ACS data (defaults 5-yr ACS)
born_in_mexico <- get_acs(geography='state',
                          variables='B05006_150',
                          year=2020)

## Column name: estimate(instead of value), moe( margin of error)

### using `survey= 'acs1' to retrieve 1-year ACS data`

born_in_mexico_1yr <- get_acs(geography='state',
                              variables='B05006_150',
                              year=2019,
                              survey='acs1')

# Get all varibles in the output

age_table <- get_acs(geography='state',
                     table = 'B01001',
                     year=2020)

# Geography variables (name must exactly match with census API)

## `csba`= metropolitan statistical area/micropolitan statistical area

cbsa_population <- get_acs(
  geography = "cbsa",
  variables = "B01003_001",
  year = 2020
)

congressional_population <- get_acs(
  geography = "congressional district",
  variables = "B01003_001",
  year = 2020
)

# Subset Geography varibles
## Specified state: `state= 'full state name` or postal code, or FIPS code

NY_income <- get_acs(
  geography = "county", 
  variables = "B19013_001", 
  state = "NY",
  year = 2020
)

## Specified county: `county= 'county name' or FIPS code`

broome_income <- get_acs(
  geography = "tract", 
  variables = "B19013_001", 
  state = "NY", 
  county = "Broome",
  year = 2020
)

# check the number of rows
nrow(NY_income)

## compared with 1-year ACS data
NY_income_1yr <- get_acs(
  geography = "county", 
  variables = "B19013_001", 
  state = "NY",
  year = 2019,
  survey = "acs1"
)

nrow(NY_income_1yr)

# Searching varibles in census datasets

load_variables(year = 2020, dataset = "pl")

load_variables(year = 2020, dataset = "acs5")

load_variables(year = 2020, dataset = "acs5/profile")

v16 <- load_variables(2016, "acs5", cache = TRUE)


# Understanding geoid

cimarron_blocks <- get_decennial(
  geography = "block",
  variables = "H1_001N",
  state = "NY",
  county = "Broome",
  year = 2020,
  sumfile = "pl"
)

# Changing varible names

ga <- get_acs(
  geography = "county",
  state = "Georgia",
  variables = c(median_income = "B19013_001",
                median_age = "B01002_001"),
  year = 2020
)

## Wide format
ga_wide <- get_acs(
  geography = "county",
  state = "Georgia",
  variables = c(median_income = "B19013_001",
                median_age = "B01002_001"),
  year = 2020,
  output = "wide"
)

