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
data_orig <- st_read(file.path(basedir, "raw", "country", "us", "noaa_w.shp")) %>%
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
    Owner_name_english = "NNational Oceanic and Atmospheric Administration", # required
    Owner_code = "NOAA", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "usa",
    System_name_english = "Pacific Fishery Management Council Salmon Fishery Management Areas", # required
    System_code = "PFMC", # required
    System_code_official = "1", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "National Oceanic and Atmospheric Administration. (07 Sept 2022). Pacific Fishery Management Council. www.fisheries.noaa.gov. Retrieved 25 May 2023: https://www.fisheries.noaa.gov/west-coast/sustainable-fisheries/pacific-fishery-management-council#:~:text=The%20PFMC%20has%20jurisdiction%20over,seen%20on%20the%20map%20below", # required
    System_source_date = "2022-09-07", # required
    System_shape_file = "noaa_w.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "Salmon Fishery Management Areas", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Salmon Fishery Management Area", Area_code), # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "us", "us_2.Rds"))
