library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "us", "us_state_waters.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry,
         Area_descriptive_name = Area_descr) %>%
  mutate(System_georef_code = "Area_code")

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "United States of America", # required
    Owner_code = "USA", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "usa",
    System_name_english = "US State Water Boundaries", # required
    System_code = "SWB", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "National Oceanic and Atmospheric Administration. (08 March 2023). US States and Territories. weather.gov. Retrived on 13 July 2023 from https://www.weather.gov/gis/USStates", # required
    System_source_date = "2023-03-08", # required
    System_shape_file = "us_state_waters.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Used buffer to create 3 nautical mile boarder around US States", # required
    System_type = "Government Jurisdication Boundary", # required
    System_category = "Management Area Area", # required
    Area_systematic_name_english = paste(Area_descriptive_name,"Waters"), # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "us", "us_4.Rds"))
