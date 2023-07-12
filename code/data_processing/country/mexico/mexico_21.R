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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "pulpo_2.shp")) %>%
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
    Owner_name_english = "National Institute of Fisheries and Aquaculture", # required
    Owner_name_localized = "Instituto Nacional de Pesca y Acuacultura", # preferred if no official translation unless not roman alphabet
    Owner_code = "INAPESCA", # required
    Owner_code_localized = "INAPESCA", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "mex",
    System_name_english = "Fisheries Management Plan for the Eastern Coast of Baja California", # required
    System_name_localized = "Plan de Manejo Pesquero de la Costa Oriental de Baja California",
    System_code = "O FMP", # required
    System_code_localized = "O PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("Octopus bimaculatus and Octopus hubbsorum"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (15 Feb 2022). Plan de Manejo Pesquero de la Costa Oriental de Baja California. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/97664", # required
    System_source_date = "2022-02-15", # required
    System_shape_file = "pulpo_2.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 12 2023", # required
    System_type = "Eastern Coast of Baja California Octopus Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Eastern Coast of Baja California", # required
    Area_descriptive_name = "la Costa Oriental de Baja California",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_21.Rds"))
