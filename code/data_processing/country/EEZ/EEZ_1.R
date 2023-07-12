library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "MR_EEZ", "eez_v11.shp")) %>%
  select(GEONAME, MRGID, geometry, ISO_TER1, TERRITORY1) %>%
  rename(geom = geometry,
         Area_code = MRGID,
         Area_descriptive_name = GEONAME,
         System_code = ISO_TER1,
         System_name_english = TERRITORY1)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # add columns
  mutate(
    Owner_name_english = "Marine Regions", # required
    Owner_code = "MR", # required
    Owner_code_official = "0", # required
    Owner_multinational = "1", # required
    System_code_official = "1", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Flanders Marine Institute (2019). Maritime Boundaries Geodatabase: Maritime Boundaries and Exclusive Economic Zones (200NM), version 11. Available online at https://www.marineregions.org/. https://doi.org/10.14284/386", # required
    System_source_date = "2019-01-01", # required
    System_shape_file = "eez_v11.shp",
    System_georef_code = "MRGID",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "downloaded version 11 of the Marine Regions EEZs", # required
    System_type = "Exclusive Economic Zone", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste(System_name_english, "EEZ"), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "EEZ", "EEZ_1.Rds"))
