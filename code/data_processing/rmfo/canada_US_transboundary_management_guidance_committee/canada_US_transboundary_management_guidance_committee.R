library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "canada_US_transboundary_management_guidance_committee", "canada_US_transboundary_management_guidance_committee.shp"))

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
    Owner_name_english = "Canada US Transboundary Management Guidance Committee", # required
    Owner_code = "TRAC", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "Georges Bank Management Areas", # required
    System_code = "TRAC MAs", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_ASFIS = "COD, HAD, YEL",
    System_species_description = "Atlantic Cod, Haddock, and Yellowtail Flounder",
    System_source = "NOAA Fisheries Mational Marine Fisheries Service (01 Jan 2021) Allocation Shares for Canada and the USA of the Transboundary Resources of Atlantic Cod, Haddock, and Yellowtail Flounder on Georges Bank Through Fishing Year 2022. repository.library.noaa.gov. Retrieved on 31 Jan 2023 from: https://repository.library.noaa.gov/view/noaa/33217", # required
    System_source_date = "2021-01-01", # required
    System_shape_file = "canada_US_transboundary_management_guidance_committee.shp",
    System_georef_code = "Area_code",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 21 2023", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$System_type = c("Atlantic Cod and Haddock Management Area", "Yellowtail Flounder Management Area")
data$Area_systematic_name_english = c("Atlantic Cod and Haddock Management Area", "Yellowtail Flounder Management Area")# required

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "canada_US_transboundary_management_guidance_committee", "canada_US_transboundary_management_guidance_committe.Rds"))
