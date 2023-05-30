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
data_orig <- st_read(file.path(basedir, "raw", "country", "us", "alaska.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry) %>%
  mutate(System_georef_code = "Area_code")

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "National Marine Fisheries Service", # required
    Owner_code = "NMFS", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "usa",
    System_name_english = "National Marine Fisheries Service Reporting Area", # required
    System_code = "NMFS RA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "National Oceanic and Atmospheric Administration. (30 Sept 2022). Alaska Fishery Management Boundaries Map. media.fisheries.noaa.gov. Retrieved 26 May 2023: https://media.fisheries.noaa.gov/dam-migration/alaska-fisheries-boundaries-map.pdf", # required
    System_source_date = "2022-09-30", # required
    System_shape_file = "alaska.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "National Marine Fisheries Service Reporting Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Alaska National Marine Fisheries Service Reporting Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "us", "us_1.Rds"))
