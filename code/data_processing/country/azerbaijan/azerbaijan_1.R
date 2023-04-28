library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "azerbaijan", "azerbaijan.shp")) %>%
  select(Area_code, geometry)

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
    Owner_name_english = "Marine Regions", # required
    Owner_code = "MR", # required
    Owner_code_official = "0", # required
    Owner_multinational = "1", # required
    System_name_english = "Azerbaijan", # required
    System_code = "aze", # required
    System_code_official = "1", # required
    System_multispecies = "1",
    System_species_description = "Sturgeon spp.",
    System_source = "Flanders Marine Institute (2005). World Lakes, version 1. Available online at https://www.marineregions.org/.", # required
    System_source_date = "2005-01-01", # required
    System_shape_file = "azerbaijan.shp",
    System_georef_code = "Area_code",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Alicia Caughman split worldlakes.shp so that only Azerbaijan owned areas of the Caspian See were included in QGIS on April 28 2023", # required
    System_type = "Azerbaijan Caspian Sea Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Azerbaijan Caspian Sea", # required
    Area_descriptive_name = "Caspian Sea",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "azerbaijan", "azerbaijan_1.Rds"))
