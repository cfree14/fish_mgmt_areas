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
data_orig <- st_read(file.path(basedir, "raw", "base_maps", "ne_10m_lakes.shp")) %>%
  filter(name == "Lake Peipus")

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
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry) %>%
  rename(Area_code = scalerank) %>%
  rename(Area_systematic_name_english = name) %>%
  mutate(System_georef_code = "scalerank") %>%
  select(Area_systematic_name_english, geom, System_georef_code, Area_code)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Peipsi Center for Transboundary Cooperation", # required
    Owner_code = "Peipsi CTC", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "Peipsi CTC Management Area", # required
    System_code = "Peipsi CTC MA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Patterson, Tom. Kelso, Nathaniel Vaughn. (2012). World Lakes, 1:10 million (2012). [Shapefile]. North American Cartographic Information Society. Retrieved on April 05 2020 from https://earthworks.stanford.edu/catalog/stanford-vb803vy4402", # required
    System_source_date = "01-01-2012", # required
    System_shape_file = "data.zip",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Filtered ne_10m_lakes.shp to contain only Lake Peipus on 05 April 2023", # required
    System_type = "Lake Peipsi Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Lake Peipsi", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "peipsi_center_for_transboundary_cooperation", "peipsi_center_for_transboundary_cooperation.Rds"))
