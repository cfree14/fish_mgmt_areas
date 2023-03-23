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
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "peipsi_center_for_transboundary_cooperation", "E_201_meri_a.shp"))

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
  rename(System_georef_code = objectid) %>%
  rename(Area_systematic_name_english = name) %>%
  select(Area_systematic_name_english, geom, System_georef_code)

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
    System_source = "Republic of Estonia. (01 Jan 2018). Estonian Land Board 2018. geoportaal.maaamet.ee Retrieved 21 March 2023: https://geoportaal.maaamet.ee/eng/Maps-and-Data/Estonian-Topographic-Database/Download-Topographic-Data-p618.html", # required
    System_source_date = "2018-01-01", # required
    System_shape_file = "ETAK_Eesti_SHP_veekogud.zip",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "", # required
    System_type = "Lake Peipsi Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Lake Peipsi", # required
    Area_code = System_georef_code,
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexican_lake_management_1.Rds"))
