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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "pesquero_verdillo.shp")) %>%
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
    System_name_english = "Fisheries Management Plan for Verdillo in the Baja California Peninsula", # required
    System_name_localized = "Plan de Manejo Pesquero para Verdillo en la Península de Baja California",
    System_code = "AXN FMP", # required
    System_code_localized = "AXN PMP",
    System_code_official = "0", # required
    System_multispecies = "0",
    System_ASFIS = "AXN",
    System_species_description = paste("Paralabrax nebulifer"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (01 March 2021). Plan de Manejo Pesquero para Verdillo en la Península de Baja California. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-para-verdillo-en-la-peninsula-de-baja-california", # required
    System_source_date = "2021-03-01", # required
    System_shape_file = "pesquero_verdillo.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 14 2023", # required
    System_type = "Verdillo Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Verdillo in the Baja California Peninsula", # required
    Area_descriptive_name = "Verdillo en la Península de Baja California",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_20.Rds"))
