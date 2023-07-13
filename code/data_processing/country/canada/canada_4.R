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
data_orig <- st_read(file.path(basedir, "raw", "country", "canada", "shapefiles", "redfish.shp")) %>%
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
    Owner_name_english = "Fisheries and Oceans Canada", # required
    Owner_code = "DFO", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "can",
    System_name_english = "Fisheries and Oceans Redfish Stock Assessment Units", # required
    System_code = "DFO RSAU", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "Sebastes mentella and Sebastes fasciatus",
    System_source = "Fisheries and Oceans Canada. (01 Sept 2021). REDFISH (SEBASTES MENTELLA AND SEBASTES FASCIATUS) STOCKS ASSESSMENT IN UNITS 1 AND 2 IN 2021. dfo-mpo.gc.ca. Retrieved 12 July 2023: https://waves-vagues.dfo-mpo.gc.ca/library-bibliotheque/41078445.pdf", # required
    System_source_date = "2021-09-01", # required
    System_shape_file = "redfish.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman on 12 July 2023", # required
    System_type = "Fisheries and Oceans Canada Assessment Units", # required
    System_category = "Assessment Area", # required
    Area_code_official = "1", # required
    System_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "canada", "canada_4.Rds"))
