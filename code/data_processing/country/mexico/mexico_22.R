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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "pulpo_gm_y_mc.shp")) %>%
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
    System_name_english = "Octopus Fishery Management Plan in the Gulf of Mexico and Caribbean Sea", # required
    System_name_localized = "Plan de Manejo Pesquero de Pulpo en el Golfo de México y Mar Caribe",
    System_code = "FMP", # required
    System_code_localized = "PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("O. maya and O. vulgaris"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (28 March 2014). Plan de Manejo Pesquero de Pulpo en el Golfo de México y Mar Caribe. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-de-pulpo-en-el-golfo-de-mexico-y-mar-caribe", # required
    System_source_date = "2014-03-28", # required
    System_shape_file = "pulpo_gm_y_mc.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 14 2023", # required
    System_type = "Octopus in the Gulf of Mexico and Caribbean Sea Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Octopus Fishery in the Gulf of Mexico and Caribbean Sea", # required
    Area_descriptive_name = "Pulpo en el Golfo de México y Mar Caribe",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_22.Rds"))
