library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "isle_of_man", "isle_of_man.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry) %>% # required
  # add columns
  mutate(
    Owner_name_english = "Scottish Government", # required
    Owner_code = "SG", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    System_name_english = "Isle of Man", # required
    System_code = "imn", # required
    Owner_country = "gb-sct",
    System_code_official = "1", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Scottish Government (2014). Isle of Man Territorial Sea. marine.scot.gov. Retrieved on May 03 2023 from: https://marine.gov.scot/maps/540", # required
    System_source_date = "2014-10-14", # required
    System_shape_file = "isle_of_man.shp",
    System_georef_code = "Area_code",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 03 2023", # required
    System_type = "Isle of Man Territorial Sea", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Isle of Man Territorial Sea", # required
    Area_descriptive_name = "Isle of Man Territorial Waters",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "isle_of_man", "isle_of_man_1.Rds"))
