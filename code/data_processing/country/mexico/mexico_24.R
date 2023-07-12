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
data_orig <- st_read(file.path(basedir, "raw", "country", "mexico", "rayas_del_golfo_de_mexico.shp")) %>%
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
    System_name_english = "Fishery Management Plan for sharks and rays in the Gulf of Mexico and the Mexican Caribbean Sea", # required
    System_name_localized = "Plan de Manejo Pesquero para tiburones y rayas del Golfo de México y Mar Caribe Mexicano",
    System_code = "ELASMO FMP", # required
    System_code_localized = "ELASMO PMP",
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = paste("Rhizoprionodon terraenovae, Carcharhinus acronotus, Sphyrna lewini, Sphyrna tiburo, Carcharhinus limbatus and Carcharhinus leucas; Hypanus americanus, Aetobatus narinari, Rhinoptera bonasus and Gymnura micrura"),
    System_source = "Instituto Nacional de Pesca y Acuacultura. (09 June 2022).PMP para Tiburones y Rayas del Golfo de México. www.gob.mx/inapesca. Retrieved 14 March 2023: https://www.gob.mx/inapesca/documentos/pmp-para-tiburones-y-rayas-del-golfo-de-mexico", # required
    System_source_date = "2022-06-09", # required
    System_shape_file = "rayas_del_golfo_de_mexico.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on April 14 2023", # required
    System_type = "Management Area for sharks and rays in the Gulf of Mexico and the Mexican Caribbean Sea", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Directed fishing and bycatch areas for sharks and rays in the Gulf of Mexico and the Mexican Caribbean Sea", # required
    Area_descriptive_name = "tiburones y rayas del Golfo de México y Mar Caribe Mexicano",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_24.Rds"))
