library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "commission_conservation_southern_bluefin_tuna", "bluefin_tuna.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(geometry, Area_code) %>%
  rename(geom = geometry)

data <- data %>%
  # add columns
  mutate(
    System_georef_code = "Area_code",
    Owner_name_english = "Commission for the Conservation of Southern Bluefin Tuna", # required
    Owner_code = "CCSBT", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "CCSBT Statistical Areas", # required
    System_code = "CCSBTAoC", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = "Thunnus maccoyii",
    System_source = "Commission for the Conservation of Southern Bluefin Tuna. (Nov 2006). CCSBT Southern Bluefin Tuna Statistical Document Program. Retrived on Feb 02 2023 from https://www.ccsbt.org/sites/default/files/userfiles/file/docs_english/operational_resolutions/trade_information_scheme.pdf", # required
    System_source_date = "2006-01-11", # required
    System_shape_file = "bluefin_tuna.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on 12 April 2023", # required
    System_type = "CCSBT Statisticial Areas", # required,
    Area_systematic_name_english = paste("Statistical Area", Area_code),
    System_category = "Statistical Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "commission_conservation_southern_bluefin_tuna", "commission_conservation_southern_bluefin_tuna_2.Rds"))
