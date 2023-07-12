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
data_orig <- st_read(file.path(basedir, "raw", "country", "greenland", "greenland_1.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry,
         Area_descriptive_name = Area_descr) %>%
  mutate(System_georef_code = "Area_code")

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Greenland Institute of Nature", # required
    Owner_name_localized = "Grønlands Naturinstitut", # required
    Owner_code = "GIN", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "grl",
    System_name_english = "West Greenland Snow Crab Fishery Management Areas", # required
    System_code = "MA", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = "Snow Crab",
    System_source = "AnnDorte Burmeister . (01 Nov 2010).  Assessment and advise of snow crab in west Greenland 2011. natur.gl. Retrieved 25 May 2023: https://natur.gl/wp-content/uploads/2010/01/83-Assessment-and-advice-of-Snow-Crab-in-West-Greenland-2010.pdf", # required
    System_source_date = "2010-11-01", # required
    System_shape_file = "greenland_1.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "Snow Crab Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Snow Crab Management Area", Area_code), # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "greenland", "greenland_3.Rds"))
