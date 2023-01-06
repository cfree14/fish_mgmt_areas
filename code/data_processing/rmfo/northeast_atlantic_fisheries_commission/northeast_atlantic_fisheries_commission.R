library(tidyverse)
library(sf)

# Setup
################################################################################

# https://www.neafc.org/managing_fisheries/measures/ra_map

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "NEAFC_map.KML"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84)

data <- data %>%
  # rename to geom
  rename(geom = geometry) %>% # required
  select(-Description) %>%
  # add columns
  mutate(
    Owner_name_english = "North-East Atlantic Fisheries Commision", # required
    Owner_code = "NEAFC", # required
    Owner_code_official = 1, # required
    Owner_multinational = 1, # required
    System_name_english = "NEAFC Regulatory Areas", # required
    System_code = "", # required
    System_code_localized = "NEAFCRA",
    System_code_official = 0, # required
    System_multispecies = "",
    System_species_description = "",
    System_source = "", # required
    System_source_date = "2011-01-01", # required
    System_shape_file = "",
    System_georef_code = "",
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "", # required
    System_type = "", # required
    System_type_code = "",
    System_category = "Regulatory Area", # required
    Area_systematic_name_english = "", # required
    Area_systematic_name_localized = "",
    Area_descriptive_name = "",
    Area_code = "", # required
    Area_code_official = "", # required
    Area_parent_area = "",
    Area_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = here::here("processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission.Rds"))
