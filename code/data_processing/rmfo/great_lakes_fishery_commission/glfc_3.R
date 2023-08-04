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
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "great_lakes_yellow_perch.shp")) %>%
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
    Owner_name_english = "Great Lakes Fishery Commission", # required
    Owner_code = "GLFC", # required
    Owner_code_official = "0", # required
    Owner_multinational = "1", # required
    System_name_english = "Lake Erie Management Units", # required
    System_code = "MU", # required
    System_code_official = "1", # required
    System_multispecies = "0",
    System_ASFIS = "FPY",
    System_species_description = "Yellow Perch",
    System_source = "Yellow Perch Task Group. (01 April 2023). Report by the Lake Erie Yellow Perch Task Group. www.glfc.org. Retrieved 25 May 2023: http://www.glfc.org/pubs/lake_committees/erie/YPTG_docs/annual_reports/YPTG_report_2023.pdf", # required
    System_source_date = "2023-04-01", # required
    System_shape_file = "great_lakes_yellow_perch.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "Lake Erie Yellow Perch Management Units", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Yellow Perch Management Unit", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "glfc_3.Rds"))
