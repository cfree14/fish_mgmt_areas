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
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "great_lakes_fishery_commission", "LAGOS_NE_All_Lakes_1ha.shp"))


%>%
  filter(NAME == "Presa Ignacio Allende") %>%
  # Reproject
  sf::st_transform(wgs84)

# st_write(data_orig, file.path(basedir, "raw", "country", "mexico", "pmp_presa_ignacio_allende.shp"))

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
  rename(georef_code = ObjectID) %>%
  rename(Area_systematic_name_localized = NAME) %>%
  select(Area_systematic_name_localized, geom, georef_code)

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
    System_source = "AUTHOR. (DATE). TITLE. SHORT WEB Retrieved 22 March 2023: FULL WEB", # required
    System_source_date = "2022-08-08", # required
    System_shape_file = "",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Great Lakes", # required
    Area_code = ,
    Area_code_official = "", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "great_lakes_fishery_commission.Rds"))
