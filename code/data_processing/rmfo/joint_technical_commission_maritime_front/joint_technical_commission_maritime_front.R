library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "joint_technical_commission_maritime_front", "RFB_CTMFM.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

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
  rename(geom = geometry) %>% # required
  # add columns
  mutate(
    Owner_name_english = "", # required
    Owner_name_localized = "", # preferred if no official translation unless not roman alphabet
    Owner_code = "", # required
    Owner_code_localized = "", # preferred if no official translation
    Owner_code_official = "", # required
    Owner_multinational = "", # required
    Owner_country = "",
    System_name_english = "", # required
    System_name_localized = "",
    System_additional_descriptor = "",
    System_code = "", # required
    System_code_localized = "",
    System_code_official = "", # required
    System_code_disambiguation = "",
    System_multispecies = "",
    System_species_description = "",
    System_source = "", # required
    System_source_date = "2020-01-30",
    System_shape_file = "RFB_CTMFM.zip",
    System_georef_code = "",
    System_license_terms = "", # required
    System_lineage = "Downloaded and imported from data.apps.fao.org on 17 Jan 2023", # required
    System_comment = "",
    System_type = "", # required
    System_type_code = "",
    System_category = "", # required
    Area_systematic_name_english = "", # required
    Area_systematic_name_localized = "",
    Area_descriptive_name = "",
    Area_code = "", # required
    Area_code_official = "", # required
    Area_parent_area = "",
    Area_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "XXX", "XXX.Rds"))
