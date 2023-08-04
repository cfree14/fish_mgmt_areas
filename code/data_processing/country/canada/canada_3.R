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
data_orig <- st_read(file.path(basedir, "raw", "country", "canada", "shapefiles", "rock_crab.shp")) %>%
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
    System_name_english = "Fisheries and Oceans Canada Rock Crab Regions", # required
    System_code = "DFO RCFA", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_ASFIS = "ROC",
    System_species_description = "Rock Crab",
    System_source = "Fisheries and Oceans Canada. (28 Oct 2021). Rock Crab Fishing Areas. dfo-mpo.gc.ca. Retrieved 12 July 2023: https://www.glf.dfo-mpo.gc.ca/glf/en/rock-crab-fishing-areas", # required
    System_source_date = "2021-10-28", # required
    System_shape_file = "rock_crab.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman on 12 July 2023", # required
    System_type = "Fisheries and Oceans Canada Fishing Areas", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    System_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "canada", "canada_3.Rds"))
