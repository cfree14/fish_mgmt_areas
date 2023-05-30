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
data_orig <- st_read(file.path(basedir, "raw", "country", "greenland", "greenland_2.shp")) %>%
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
    Owner_name_english = "Northwest Atlantic Fisheries Organization", # required
    Owner_code = "NAFO", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "grl",
    System_name_english = "West Greenland NAFO Areas", # required
    System_code = "WG", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Northwest Atlantic Fisheries Organization. (01 Jan 2021). Denmark/Greenland Research Report for 2021. www.nafo.int. Retrieved 25 May 2023: https://www.nafo.int/Portals/0/PDFs/sc/2022/scs22-12REV2.pdf", # required
    System_source_date = "2021-01-01", # required
    System_shape_file = "greenland_2.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "NAFO Management Areas", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("NAFO Area", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "greenland", "greenland_2.Rds"))
