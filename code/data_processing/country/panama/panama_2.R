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
    Owner_name_english = "Sustainable Development and Fishing Center", # required
    Owner_name_localized = "Centro Desarrollo y Pesca Sustentable", # preferred if no official translation unless not roman alphabet
    Owner_code = "SDFC", # required
    Owner_code_localized = "CeDePesca", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "pan",
    System_name_english = "Small Pelagics Fishing Areas", # required
    System_code = "SMFA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Centro Desarrollo y Pesca Sustentable. (01 March 2015). Small Pelagic Fishery in Panama, Stock Assessment and Recommendations for a Management Plant. www.cedepesca.net Retrieved 12 March 2023:http://www.cedepesca.net/wp-content/uploads/2016/05/The_Panama_small_pelagics_fishery.pdf", # required
    System_source_date = "2015-05-01", # required
    System_shape_file = "panama_pelagics.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 12 2023", # required
    System_type = "Panama Small Pelagics Fishing Areas", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Small Pelagics Fishing Area", Area_code), # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date(),
    System_georef_code = "Area_code"
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "panama", "panama_2.Rds"))
