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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "pez_espada.shp")) %>%
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
    System_name_english = "National Fishing Card  for Swordfish", # required
    System_name_localized = "Carta Nacional Pesquera",
    System_code = "SWO NFC", # required
    System_code_localized = "SWO CNP",
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = paste("Xiphias gladius"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (24 Aug 2012). SECRETARIA DE AGRICULTURA, GANADERIA, DESARROLLO RURAL, PESCA Y ALIMENTACION. www.gob.mx/. Retrieved 13 July 2023: https://www.gob.mx/cms/uploads/attachment/file/153374/Carta-Nacional-Pesquera-2012.pdf", # required
    System_source_date = "2012-08-24", # required
    System_shape_file = "pez_espada.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on July 13 2023", # required
    System_type = "Capture Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Capture Area for Swordfish", # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_27.Rds"))
