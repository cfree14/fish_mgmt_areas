library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "southern_indian_ocean_fisheries_agreement", "RFB_SIOFA.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(geometry, OBJECTID)

data <- data %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry,
         Area_code = OBJECTID) %>% # required
  # add columns
  mutate(
    System_georef_code = "OBJECTID",
    Owner_name_english = "South Indian Ocean Fisheries Agreement", # required
    Owner_code = "SIOFA", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "SIOFA Area of Competence", # required
    System_code = "SIOFAAoC", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Food and Agriculture Organization (FAO). (30 Jan 2020). Geographic Area of Competence of South Indian Ocean Fisheries Agreement (SIOFA). data.apps.fao.org. Retrieved 17 Jan 2023: https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-siofa", # required
    System_source_date = "2020-01-30", # required
    System_shape_file = "RFB_SIOFA.zip",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from data.apps.fao.org on 17 Jan 2023", # required
    System_type = "Area of Competence", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "SIOFA Area of Competence 5",
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "southern_indian_ocean_fisheries_agreement", "southern_indian_ocean_fisheries_agreement.Rds"))
