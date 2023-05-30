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
data_orig <- st_read(file.path(basedir, "raw", "country", "scotland", "scotland.shp")) %>%
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
    Owner_name_english = "The Scottish Government", # required
    Owner_code = "SCT", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "gb-sct",
    System_name_english = "Crab and Lobster Fishery Assessment Areas", # required
    System_code = "FAA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "brown crab (Cancer pagurus), velvet crab (Necora puber) and lobster (Homarus gammarus)",
    System_source = "C Mesquita, A Ellis, T Miethe and H Dobby. (20 March 2023). Crab and lobster fisheries - stock assessments: results 2016 to 2019. www.gov.scot. Retrieved 25 May 2023: https://www.gov.scot/publications/crab-lobster-fisheries-scotland-results-stock-assessments-2016-2019/pages/9/", # required
    System_source_date = "2023-03-20", # required
    System_shape_file = "scotland.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "Scottish Crab and Lobster Fishery Assessment Areas", # required
    System_category = "Assessment Area", # required
    Area_systematic_name_english = paste("Crab and Lobster Fishery Assessment Area", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "scotland", "scotland_1.Rds"))
