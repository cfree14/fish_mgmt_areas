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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "Altata_ensenada_del_Pabell_n_Sinaloa.shp")) %>%
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
    System_name_english = "Ecosystem Fisheries Management Plan for the Altata-Ensenada del Pabellón Lagoon System, Sinaloa", # required
    System_name_localized = "Plan de Manejo Pesquero Ecosistémico del Sistema Lagunar Altata-Ensenada del Pabellón, Sinaloa",
    System_code = "FMP", # required
    System_code_localized = "PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("Shrimp, Crabs, Clams, Oysters, snails, finfish, and rays"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (24 Sept 2019). Plan de Manejo Pesquero Ecosistémico del Sistema Lagunar Altata-Ensenada del Pabellón, Sinaloa. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-ecosistemico-del-sistema-lagunar-altata-ensenada-del-pabellon-sinaloa", # required
    System_source_date = "2019-09-24", # required
    System_shape_file = "Altata_ensenada_del_Pabell_n_Sinaloa.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 12 2023", # required
    System_type = "Altata-Ensenada del Pabellón Lagoon System, Sinaloa Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Altata-Ensenada del Pabellón Lagoon System, Sinaloa", # required
    Area_descriptive_name = "Ecosistémico del Sistema Lagunar Altata-Ensenada del Pabellón, Sinaloa",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_2.Rds"))
