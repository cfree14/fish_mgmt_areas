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
data_orig <- st_read(file.path(basedir, "raw", "country", "canada", "Fisheries_Management_Zone", "Fisheries_Management_Zone.shp")) %>%
  sf::st_transform(wgs84) %>%
  select(FISHERIES_, geometry, SYSTEM_DAT)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry,
         Area_code = FISHERIES_,
         System_source_date = SYSTEM_DAT) %>%
  mutate(System_georef_code = "FISHERIES_")

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Ministry of Natural Resources and Forestry", # required
    Owner_code = "MNRF", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "can",
    System_name_english = "Ministry of Natural Resources and Forestry Ontario Management Zones", # required
    System_code = "MNRF MZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Ministry of Natural Resources and Forestry. (03 Nov 2021). Fisheries Management Zone. geohub.lio.gov.on.ca. Retrieved 07 June 2023: https://geohub.lio.gov.on.ca/datasets/fisheries-management-zone", # required
    System_shape_file = "Fisheries_Management_Zone.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Downloaded from geohub.lio.gov.on.ca on 07 June 2023", # required
    System_type = "Ontario Management Zones", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    System_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "canada", "canada_7.Rds"))
