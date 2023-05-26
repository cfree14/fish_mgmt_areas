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
data_orig <- st_read(file.path(basedir, "raw", "country", "panama", "panama_pelagics.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Hector M. Guzman, Roberto Cipriani, Angel J. Vega, Jorge Manuel Morales‐Saldaña", # required
    Owner_code = "HG", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "pan",
    System_name_english = "Shark Fishing Areas", # required
    System_code = "SFA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "Sharks",
    System_source = "Hector M. Guzman, Roberto Cipriani, Angel J. Vega, Jorge Manuel Morales‐Saldaña. (23 Aug 2019). Fisheries and conservation assessment of sharks in Pacific Panama. Retrieved 12 March 2023: https://onlinelibrary.wiley.com/doi/full/10.1002/aqc.3245", # required
    System_source_date = "2019-08-23", # required
    System_shape_file = "panama_shark.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 12 2023", # required
    System_type = "Panama Shark Fishing Areas", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Shark Fishing Area", Area_code), # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date(),
    System_georef_code = "Area_code"
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "panama", "panama_1.Rds"))
