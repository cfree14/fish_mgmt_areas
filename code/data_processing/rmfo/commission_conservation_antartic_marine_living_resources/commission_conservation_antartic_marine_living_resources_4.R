library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "commission_conservation_antartic_marine_living_resources", "ssmusPolygon.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(geometry, GAR_Name, ModifiedOn, GAR_Long_L)

data <- data %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry,
         Area_systematic_name_english = GAR_Name,
         System_source_date = ModifiedOn,
         Area_code = GAR_Long_L) %>% # required
  # add columns
  mutate(
    System_georef_code = "GAR_Long_L",
    Owner_name_english = "Commission for the Conservation of Antarctic Marine Living Resources", # required
    Owner_code = "CCAMLR", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "CCAMLR Small Scale Management Units", # required
    System_code = "CCAMLR SSMU", # required
    System_code_official = "1", # required
    System_multispecies = "0",
    System_species_description = "Krill",
    System_source = "Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR). (04 Aug 2022). CCAMLR Public Data Repository. github.com. Retrieved 2 Feb 2023: https://github.com/ccamlr/data/tree/main/geographical_data/ssmu", # required
    System_shape_file = "ssmus.zip",
    System_license_terms = "Public Domain", # required
    System_lineage = "Downloaded and imported from github.com/ccamlr/data on 2 Feb 2023", # required
    System_type = "Small Scale Management Units", # required
    System_category = "Assessment Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_4.Rds"))
