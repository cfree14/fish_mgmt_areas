library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig1 <- st_read(file.path(basedir, "raw", "rmfo", "pacific_salmon_commission", "us_ps.shp"))
data_orig2 <- st_read(file.path(basedir, "raw", "rmfo", "pacific_salmon_commission", "ca_ps.shp"))

data_orig = rbind(data_orig1, data_orig2)
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
    System_georef_code = "Area_code",
    Owner_name_english = "Pacific Salmon Commission", # required
    Owner_code = "PSC", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "PSC Area of Competence", # required
    System_code = "PSCAoC", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_ASFIS = "SAL",
    System_species_description = "Salmon",
    System_source = "Pacific Salmon Commission. (December 2022). 37th PSC Annual Report (2021/22). Retieved on Feb 02 2023 from https://www.psc.org/publications/annual-reports/commission/", # required
    System_source_date = "2022-12-01", # required
    System_shape_file = "pacific_salmon.shp",
    System_license_terms = "Public domain", # required
    System_lineage = "Digitized using QGIS on 04 April 2023", # required
    System_type = "Management and Catch Reporting Areas", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required,
    Area_systematic_name_english = paste("Management Area", Area_code),
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )


# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "pacific_salmon_commission", "pacific_salmon_commission_2.Rds"))
