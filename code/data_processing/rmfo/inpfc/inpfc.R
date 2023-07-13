library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "INPFC", "inpfc.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  rename(Area_descriptive_name = Area_descr,
         geom = geometry)

data <- data %>%
  # add columns
  mutate(
    System_georef_code = "Area_code",
    Owner_name_english = "Pacific Fishery Management Council", # required
    Owner_code = "INPFC", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "INPFC Groudfish Fishery Management Plan", # required
    System_code = "INPFC GFMP", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Pacific Fishery Management Council. (01 Aug 2022). PACIFIC COAST GROUNDFISH FISHERY MANAGEMENT PLAN FOR THE CALIFORNIA, OREGON, AND WASHINGTON GROUNDFISH FISHERY. pcouncil.org. Retrieved 12 July 2023: https://www.pcouncil.org/documents/2022/08/pacific-coast-groundfish-fishery-management-plan.pdf/", # required
    System_source_date = "2022-08-01", # required
    System_shape_file = "inpfc.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on 12 July 2023", # required
    System_type = "Fishery Mangement Plan", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_code = c(4, 3, 5, 1, 2, 6)

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "inpfc", "inpfc.Rds"))
