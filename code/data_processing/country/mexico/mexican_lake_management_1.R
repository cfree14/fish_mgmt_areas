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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "mexico_water_and_popdesn_map", "mexico_water_and_popdesn_map.shp")) %>%
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
  rename(Area_code = ObjectID) %>%
  rename(Area_systematic_name_localized = NAME) %>%
  mutate(System_georef_code = "ObjectID") %>%
  select(Area_systematic_name_localized, geom, System_georef_code, Area_code)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "National Institute of Fisheries and Aquaculture", # required
    Owner_name_localized = "Instituto Nacional de Pesca y Acuacultura", # preferred if no official translation unless not roman alphabet
    Owner_code = "INAPESCA", # required
    Owner_code_localized = "INAPESCA", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "mex",
    System_name_english = "Fisheries Management Plan of the Ignacio Allende Dam, Municipality of San Miguel", # required
    System_name_localized = "Plan de Manejo Pesquero de la Presa Ignacio Allende, Municipio de San Miguel",
    System_code = "FMP", # required
    System_code_localized = "PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("Cyprinus carpio,", "Chirostoma jordani, and", "Oreochromis spp."),
    System_source = "ArcGIS Hub. (08 Aug 2022). Mexican Water Bodies. hub.arcgis.com Retrieved 21 March 2023: https://hub.arcgis.com/datasets/eabd5284fd764f0699998eec2f306928/explore?layer=2&location=26.015994%2C-105.024935%2C6.81", # required
    System_source_date = "2022-08-08", # required
    System_shape_file = "mexico_water_and_popdesn_map.zip",
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "Filtered mexico_water_and_popdesn_map.shp for NAME == Presa Ignacio Allende", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Presa Ignacio Allende", # required
    Area_descriptive_name = "Ignacio Allende Dam",
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexican_lake_management_1.Rds"))
