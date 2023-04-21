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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "pelagicos_menores_no_mexico.shp")) %>%
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
    System_name_english = "Fishery Management Plan for the Northwest Mexico Minor Pelagic Fishery", # required
    System_name_localized = "Plan de Manejo Pesquero para la Pesquería de Pelágicos Menores del Noroeste de México",
    System_code = "FMP", # required
    System_code_localized = "PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("monterey sardine (Sardinops sagax), long-haired sardine, three species (Opisthonema libertate, O. bulleri and O. medirastre), mackerel (Scomber japonicus), northern anchoveta (Engraulis mordax), bocona (Cetengraulis mysticetus), Japanese sardine (Etrumeus teres), charrito (Trachurus symmetricus), and pineapple (Oligoplites altus, O. refulgens, and O. saurus)"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (08 Nov 2012). Plan de Manejo Pesquero para la Pesquería de Pelágicos Menores del Noroeste de México. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-para-la-pesqueria-de-pelagicos-menores-del-noroeste-de-mexico", # required
    System_source_date = "2012-11-08", # required
    System_shape_file = "pelagicos_menores_no_mexico.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 14 2023", # required
    System_type = "Northwest Mexico Minor Pelagic Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Northwest Mexico Minor Pelagic Fishery", # required
    Area_descriptive_name = "Pelágicos Menores del Noroeste de México",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_18.Rds"))
