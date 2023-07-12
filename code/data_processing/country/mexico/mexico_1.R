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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "almeja.shp")) %>%
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
    System_name_english = "Chocolata Clam Fishery Management Plan in the Municipality of Loreto, Baja California Sur", # required
    System_name_localized = "Plan de Manejo Pesquero de Almeja Chocolata en el Municipio de Loreto, Baja California Sur",
    System_code = "EGQ FMP", # required
    System_code_localized = "EGQ PMP",
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = paste("Megapitaria squalida"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (25 Feb 2022). Plan de Manejo Pesquero de Almeja Chocolata en el Municipio de Loreto, Baja California Sur. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-de-almeja-chocolata-en-el-municipio-de-loreto-baja-california-sur", # required
    System_source_date = "2022-01-25", # required
    System_shape_file = "almeja.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 12 2023", # required
    System_type = "Megapitaria squalida Species Distribution", # required
    System_category = "Species Distribution Area", # required
    Area_systematic_name_english = "Chocolata Clam in the Municipality of Loreto, Baja California Sur", # required
    Area_descriptive_name = "Almeja Chocolata en el Municipio de Loreto, Baja California Sur",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_1.Rds"))
