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
data_orig1 <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "hydro_p_LakeErie.shp")) %>%
  select(UIDENT, NAMEEN, geometry)
data_orig2 <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "hydro_p_LakeHuron.shp")) %>%
  select(UIDENT, NAMEEN, geometry)
data_orig3 <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "hydro_p_LakeMichigan.shp")) %>%
  select(UIDENT, NAMEEN, geometry)
data_orig4 <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "hydro_p_LakeOntario.shp")) %>%
  select(UIDENT, NAMEEN, geometry)
data_orig5 <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "hydro_p_LakeSuperior.shp")) %>%
  select(UIDENT, NAMEEN, geometry)

data_orig = list(data_orig1, data_orig2, data_orig3, data_orig4, data_orig5) %>%
  reduce(rbind)

st_write(data_orig, file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "great_lakes.shp"))

# Format data
################################################################################

# Format data

# Author Surname or name of organisation, Author Firstname.
# (Date published or last revised). Title of webpage.
# Title of Website. Retrieved [Date Retrieved]
# from: website (e.g.: Ministry for Primary Industries (MPI). (10 Jan 2020).
# Quota Management Areas. Data.gov.nz.
# Retrieved 30 June 2022:
# https://mpi.maps.arcgis.com/home/item.html?id=83b5785c0f0b4da1a2c99dadeebdff0a)

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry) %>%
  rename(georef_code = UIDENT) %>%
  rename(Area_systematic_name_english = NAMEEN) %>%
  select(Area_systematic_name_english, geom, georef_code)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Great Lakes Fishery Commission", # required
    Owner_code = "GLFC", # required
    Owner_code_official = "0", # required
    Owner_multinational = "1", # required
    System_name_english = "Great Lakes", # required
    System_code = "GL", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "US Geological Survey (USGS). (Jan 01 2010). Great Lakes and Watersheds Shapefiles. www.sciencebase.gov Retrieved 22 March 2023: https://www.sciencebase.gov/catalog/item/530f8a0ee4b0e7e46bd300dd", # required
    System_source_date = "2010-01-01", # required
    System_shape_file = "hydro_p_LakeErie.zip, hydro_p_LakeHuron.zip, hydro_p_LakeMichigan.zip, hydro_p_LakeOntario.zip, and hydro_p_LakeSuperior.zip",
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "downloaded individual lake shapefiles from ScienceBase and merged them into one shapefile", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_code = georef_code,
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "great_lakes_fishery_commission.Rds"))
