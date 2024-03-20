## Getting Data for Abadie et al 2010 Replication

## FRED data

## Personal Income
get_yr <- function(year){
  api <- paste0("https://api.stlouisfed.org/fred/release/tables?release_id=110&api_key=84236ae7dcd2141f2e4efea249f503c1&element_id=257197&observation_date=", year, "-01-01&include_observation_values=true&file_type=json")
  pull <- jsonlite::fromJSON(api)
  return(data.table::rbindlist(pull$elements))
}


fred <- map(1970:2000, get_yr)

fred_df <- list_rbind(fred) %>%
  arrange(name, observation_date)

saveRDS(fred_fd, "personal_income.rds")


###### Census Data
pacman::p_load(tidycensus)
census_api_key("5bc2880e32458e32f01df20e05b627ce11ec335e")

# B01003_001 total population
# B01001_006 male 15-17
# B01001_007 male 18-19
# B01001_008 male 20
# B01001_009 male 21
# B01001_030 female 15-17
# B01001_031 female 18-19
# B01001_032 female 20
# B01001_033 female 21
# B01001_034 male 22-24



