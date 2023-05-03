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
data_orig <- st_read(file.path(basedir, "raw", "country", "falkland_islands", "falkland_islands.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry,
         Area_descriptive_name  = Area_descr) %>%
  mutate(System_georef_code = "Area_code")

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Falkland Islands Fisheries Department", # required
    Owner_code = "FIFD", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "flk",
    System_name_english = "Falkland Island Conservation Zones", # required
    System_code = "MZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Barton, J. 2022. Fisheries and fisheries management in Falkland Islands Conservation Zones. Aquatic Conservation: Marine and Freshwater Ecosystems 12(1):127-135", # required
    System_source_date = "2022-01-01", # required
    System_shape_file = "falkland_islands.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 28 2023", # required
    System_type = "Falkland Island Conservation Zones", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )


# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "falkland_islands", "falkland_1.Rds"))
