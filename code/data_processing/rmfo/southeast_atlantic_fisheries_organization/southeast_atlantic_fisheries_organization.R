library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "southeast_atlantic_fisheries_organization", "RFB_SEAFO.shp"))

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
         georef_code = OBJECTID) %>% # required
  # add columns
  mutate(
    Owner_name_english = "South East Atlantic Fisheries Organisation", # required
    Owner_code = "SEAFO", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "SEAFO Area of Competence", # required
    System_code = "SEAFOAoC", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Food and Agriculture Organization (FAO). (30 Jan 2020). Geographic Area of Competence of South East Atlantic Fisheries Organisation (SEAFO). data.apps.fao.org. Retrieved 17 Jan 2023: https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-seafo", # required
    System_source_date = "2020-01-30", # required
    System_shape_file = "RFB_SEAFO.zip",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from data.apps.fao.org on 17 Jan 2023", # required
    System_type = "Area of Competence", # required
    System_category = "Management Area", # required
    Area_code = georef_code, # required
    Area_systematic_name_english = "SEAFO Area of Competence 26",
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "southeast_atlantic_fisheries_organization", "southeast_atlantic_fisheries_organization.Rds"))
