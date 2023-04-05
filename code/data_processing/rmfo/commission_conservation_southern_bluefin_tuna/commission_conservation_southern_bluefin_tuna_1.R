library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "commission_conservation_southern_bluefin_tuna", "RFB_CCSBT.shp"))

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
    Owner_name_english = "Commission for the Conservation of Southern Bluefin Tuna", # required
    Owner_code = "CCSBT", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "CCSBT Area of Competence", # required
    System_code = "CCSBTAoC", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = "Thunnus maccoyii",
    System_source = "Food and Agriculture Organization (FAO). (30 Jan 2020). Geographic Area of Competence of Commission for the Conservation of Southern Bluefin Tuna (CCSBT). data.apps.fao.org. Retrieved 17 Jan 2023: https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-ccsbt", # required
    System_source_date = "2020-01-30", # required
    System_shape_file = "RFP_CCSBT.zip",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from data.apps.fao.org on 17 Jan 2023", # required
    System_type = "Area of Competence", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_systematic_name_english = c("CCSBT Area of Competence 79",
                                      "CCSBT Area of Competence 80")

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "commission_conservation_southern_bluefin_tuna", "commission_conservation_southern_bluefin_tuna_1.Rds"))
