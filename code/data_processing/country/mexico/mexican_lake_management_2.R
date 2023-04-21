library(tidyverse)
library(sf)

# Setup
################################################################################

# Directoriesf

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "caballatas.shp"))

# Format data
################################################################################

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
    System_name_english = "Fisheries Management Plan for the Cebolletas dam, Coroneo, Guanajuato, Mexico", # required
    System_name_localized = "Plan de Manejo Pesquero de la presa Cebolletas, Coroneo, Guanajuato, México",
    System_code = "FMP", # required
    System_code_localized = "PMP",
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = "Cyprinus carpio",
    System_source = "Instituto Nacional de Pesca y Acuacultura. (04 March 2021). Plan de Manejo Pesquero de la Presa Cebolletas. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-de-la-presa-cebolletas", # required
    System_source_date = "2021-03-04", # required
    System_shape_file = "caballatas.shp",
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 21 2023", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Presa Cebolletas", # required
    Area_descriptive_name = "Cebolletas Dam",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexican_lake_management_2.Rds"))
