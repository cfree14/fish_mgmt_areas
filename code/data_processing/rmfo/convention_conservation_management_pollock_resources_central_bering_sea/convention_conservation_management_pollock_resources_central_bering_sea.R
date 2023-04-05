library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "convention_conservation_management_pollock_resources_central_bering_sea", "RFB_CCBSP.shp"))

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
    Owner_name_english = "Convention on the Conservation and Management of Pollock Resources in the Central Bering Sea", # required
    Owner_code = "CCBSP", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "CCBSP Area of Competence", # required
    System_code = "CCBSPAoC", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = "Pollack",
    System_source = "Food and Agriculture Organization (FAO). (30 Jan 2020). Geographic Area of Competence of Convention on the Conservation and Management of Pollock Resources in the Central Bering Sea (CCBSP). data.apps.fao.org. Retrieved 17 Jan 2023: https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-ccbsp", # required
    System_source_date = "2020-01-30", # required
    System_shape_file = "RFB_CCBSP.zip",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from data.apps.fao.org on 17 Jan 2023", # required
    System_type = "Area of Competence", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_systematic_name_english = c("CRFM Area of Competence 13",
                                      "CRFM Area of Competence 47")

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "convention_conservation_management_pollock_resources_central_bering_sea", "convention_conservation_management_pollock_resources_central_bering_sea.Rds"))
