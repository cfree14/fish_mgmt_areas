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
data_orig1 <- st_read(file.path(basedir, "raw", "country", "mexico", "sabalo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Tarpon", # required)
         System_code = "TAR NFC", # required
         System_code_localized = "TAR CNP",
         System_multispecies = "0",
         System_ASFIS = "TAR",
         System_species_description = paste("Megalops atlanticus"),
         Area_systematic_name_english = "Capture Area for Tarpon", # required
         System_shape_file = "sabalo.shp",
         Area_code_official = "0") # required

data_orig2 <- st_read(file.path(basedir, "raw", "country", "mexico", "sardina.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Herring", # required)
         System_code = "THA NFC", # required
         System_code_localized = "THA CNP",
         System_multispecies = "1",
         System_ASFIS = "THA",
         System_species_description = paste("Opisthonema oglinum, Harengula sp., Brevoortia sp."),
         Area_systematic_name_english = "Capture Area for Herring", # required
         System_shape_file = "sardina.shp",
         Area_code_official = "0") # required

data_orig3 <- st_read(file.path(basedir, "raw", "country", "mexico", "trucha.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Weakfish", # required)
         System_code = "SWF NFC", # required
         System_code_localized = "SWF CNP",
         System_multispecies = "1",
         System_ASFIS = "SWF",
         System_species_description = paste("Cynoscion nebulosus, Cynoscion arenarius, Cynoscion nothus"),
         Area_systematic_name_english = "Capture Area for Weakfish", # required
         System_shape_file = "trucha.shp",
         Area_code_official = "0") # required

data_orig = list(data_orig1, data_orig2, data_orig3) %>%
  reduce(rbind)

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
    System_name_localized = "Carta Nacional Pesquera",
    System_code_official = "0", # required
    System_source = "Instituto Nacional de Pesca y Acuacultura. (24 Aug 2012). SECRETARIA DE AGRICULTURA, GANADERIA, DESARROLLO RURAL, PESCA Y ALIMENTACION. www.gob.mx/. Retrieved 13 July 2023: https://www.gob.mx/cms/uploads/attachment/file/153374/Carta-Nacional-Pesquera-2012.pdf", # required
    System_source_date = "2012-08-24", # required
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on July 13 2023", # required
    System_type = "Capture Area", # required
    System_category = "Management Area", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_31.Rds"))
