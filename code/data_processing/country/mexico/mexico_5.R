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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "Atun_aleta_amarilla_opm.shp")) %>%
  sf::st_transform(wgs84) %>%
  select(geometry)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry) %>%
  mutate(System_georef_code = "Area_code") %>%
  mutate(Area_code = "1")

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
    System_name_english = "Fisheries Management Plan of Pacific Ocean yellowfin tuna", # required
    System_name_localized = "Plan de Manejo Pesquero de Atún aleta amarilla del Océano Pacífico",
    System_code = "PYFT FMP", # required
    System_code_localized = "PYFT PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("Thunnus albacares, Katsuwonus pelamis,  T. obesus,  T. alalunga,  Euthynnus lineatus and Sarda spp."),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (11 July 2014). Atún aleta amarilla del Océano Pacífico. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/atun-aleta-amarilla-del-oceano-pacifico", # required
    System_source_date = "2014-07-11", # required
    System_shape_file = "Atun_aleta_amarilla_opm.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized b07-16y Alicia Caughman in QGIS on April 21 2023", # required
    System_type = "Pacific Ocean yellowfin tuna Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Pacific Ocean yellowfin tuna Management Area", # required
    Area_descriptive_name = "Atún aleta amarilla del Océano Pacífico",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_5.Rds"))
