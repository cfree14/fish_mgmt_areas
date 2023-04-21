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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "mero_yuc.shp")) %>%
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
    System_name_english = "Grouper Fisheries Management Plan in Yucatan", # required
    System_name_localized = "Plan de Manejo Pesquero de Mero en Yucatán",
    System_code = "FMP", # required
    System_code_localized = "PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("red grouper (Epinephelus morio), black grouper (Mycteroperca bonaci), haddock (M. microlepsis), hen (M. phenax), grouper (M. interstitialis), macaw (Mvenenosa), stray grouper (Hyporthodus flavolimbatus), fiat (H. nigritus), grouper (E. striatus), red clown grouper (E. guttatus), spotted grouper (H. niveatus), red grouper (Cephalopholis fulva ), grouper (E. itajara), green clown (E. adscensionis), and lentil (E. drummondhayi)"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (25 Nov 2014). Plan de Manejo Pesquero de Mero en Yucatán. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/plan-de-manejo-pesquero-de-mero-en-yucatan", # required
    System_source_date = "2014-11-25", # required
    System_shape_file = "mero_yuc.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 14 2023", # required
    System_type = "Grouper Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Grouper", # required
    Area_descriptive_name = "Mero en Yucatán",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_17.Rds"))
