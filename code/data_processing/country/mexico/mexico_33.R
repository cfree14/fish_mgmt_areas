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
data_orig1 <- st_read(file.path(basedir, "raw", "country", "mexico", "abulon.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Abalone", # required)
         System_code = "HRW NFC", # required
         System_code_localized = "HRW CNP",
         System_multispecies = "1",
         System_species_description = paste("Haliotis sp."),
         Area_systematic_name_english = "Capture Area for Abalone", # required
         System_shape_file = "abulon.shp",
         Area_code_official = "0") # required

data_orig2 <- st_read(file.path(basedir, "raw", "country", "mexico", "almeja_2.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Chocolate Clam", # required)
         System_code = "EGQ NFC", # required
         System_code_localized = "EGQ CNP",
         System_multispecies = "1",
         System_species_description = paste("Megapitaria squalida, Megapitaria aurantiaca"),
         Area_systematic_name_english = "Capture Area for Chocolate Clam", # required
         System_shape_file = "almeja_2.shp",
         Area_code_official = "0") # required

data_orig3 <- st_read(file.path(basedir, "raw", "country", "mexico", "calamar_loligo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Squid", # required)
         System_code = "S NFC", # required
         System_code_localized = "S CNP",
         System_multispecies = "0",
         System_species_description = paste("Doryteuthis opalescens"),
         Area_systematic_name_english = "Capture Area for Squid", # required
         System_shape_file = "calamar_loligo.shp",
         Area_code_official = "0") # required

data_orig4 <- st_read(file.path(basedir, "raw", "country", "mexico", "callo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Pen Shell", # required)
         System_code = "PJQ NFC", # required
         System_code_localized = "PJQ CNP",
         System_multispecies = "1",
         System_species_description = paste("Pinna rugosa, Atrina sp."),
         Area_systematic_name_english = "Capture Area for Pen Shell", # required
         System_shape_file = "callo.shp",
         Area_code_official = "0") # required

data_orig5 <- st_read(file.path(basedir, "raw", "country", "mexico", "camaron_pacifico.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Shrimp in the Pacific", # required)
         System_code = "THA NFC", # required
         System_code_localized = "THA CNP",
         System_multispecies = "1",
         System_species_description = paste("Litopenaeus sp., Farfantepenaeus sp."),
         Area_systematic_name_english = "Capture Area for Shrimp", # required
         System_shape_file = "camaron_pacifico.shp",
         Area_code_official = "0") # required

data_orig6 <- st_read(file.path(basedir, "raw", "country", "mexico", "carasol_rosa.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Chinese Snails", # required)
         System_code = "CS NFC", # required
         System_code_localized = "CS CNP",
         System_multispecies = "1",
         System_species_description = paste("Hexaplex sp."),
         Area_systematic_name_english = "Capture Area for Chinese Snail", # required
         System_shape_file = "carasol_rosa.shp",
         Area_code_official = "0") # required

data_orig7 <- st_read(file.path(basedir, "raw", "country", "mexico", "caracol_panocha.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Turbon Snails", # required)
         System_code = "TS NFC", # required
         System_code_localized = "TS CNP",
         System_multispecies = "1",
         System_species_description = paste("Megastraea sp."),
         Area_systematic_name_english = "Capture Area for Turbon Snails", # required
         System_shape_file = "caracol_panocha.shp",
         Area_code_official = "0") # required

data_orig10 <- st_read(file.path(basedir, "raw", "country", "mexico", "urchin.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Urchin", # required)
         System_code = "UYF NFC", # required
         System_code_localized = "UYF CNP",
         System_multispecies = "1",
         System_species_description = paste("Strongylocentrotus sp."),
         Area_systematic_name_english = "Capture Area for Urchin", # required
         System_shape_file = "urchin.shp",
         Area_code_official = "0") # required

data_orig11 <- st_read(file.path(basedir, "raw", "country", "mexico", "jaiba_pacifico.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Swimcrab", # required)
         System_code = "KLI NFC", # required
         System_code_localized = "KLI CNP",
         System_multispecies = "1",
         System_species_description = paste("Callinectes sp."),
         Area_systematic_name_english = "Capture Area for Swimcrab", # required
         System_shape_file = "jaiba_pacifico.shp",
         Area_code_official = "0") # required

data_orig12 <- st_read(file.path(basedir, "raw", "country", "mexico", "langosata_pacifico.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Pacific Lobster", # required)
         System_code = "NUT NFC", # required
         System_code_localized = "NUT CNP",
         System_multispecies = "1",
         System_species_description = paste("Panulirus sp."),
         Area_systematic_name_english = "Capture Area for Pacific Lobster", # required
         System_shape_file = "langosata_pacifico.shp",
         Area_code_official = "1") # required

data_orig13 <- st_read(file.path(basedir, "raw", "country", "mexico", "medusa.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Cannonball Jellyfish", # required)
         System_code = "MFX NFC", # required
         System_code_localized = "MFX CNP",
         System_multispecies = "0",
         System_species_description = paste("Stomolophus meleagris"),
         Area_systematic_name_english = "Capture Area for Cannonball Jellyfish", # required
         System_shape_file = "medusa.shp",
         Area_code_official = "0") # required

data_orig14 <- st_read(file.path(basedir, "raw", "country", "mexico", "ostion.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Herring", # required)
         System_code = "THA NFC", # required
         System_code_localized = "THA CNP",
         System_multispecies = "1",
         System_species_description = paste("Opisthonema oglinum, Harengula sp., Brevoortia sp."),
         Area_systematic_name_english = "Capture Area for Herring", # required
         System_shape_file = "ostion.shp",
         Area_code_official = "0") # required

data_orig15 <- st_read(file.path(basedir, "raw", "country", "mexico", "pepino_pacifico.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Oyster in the Pacific", # required)
         System_code = "OYA NFC", # required
         System_code_localized = "OYA CNP",
         System_multispecies = "1",
         System_species_description = paste("Crassostrea sp."),
         Area_systematic_name_english = "Capture Area for Oyster", # required
         System_shape_file = "pepino_pacifico.shp",
         Area_code_official = "0") # required

data_orig16 <- st_read(file.path(basedir, "raw", "country", "mexico", "pulpo_pacifico.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Sea cucumber in the Pacific", # required)
         System_code = "TKV NFC", # required
         System_code_localized = "TKV CNP",
         System_multispecies = "0",
         System_species_description = paste("Parastichopus parvimensis"),
         Area_systematic_name_english = "Capture Area for Sea Cucumber", # required
         System_shape_file = "pulpo_pacifico.shp",
         Area_code_official = "0") # required

data_orig17 <- st_read(file.path(basedir, "raw", "country", "mexico", "tuna.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Tuna", # required)
         System_code = "YFT NFC", # required
         System_code_localized = "YFT CNP",
         System_multispecies = "1",
         System_species_description = paste("Thunnus sp."),
         Area_systematic_name_english = "Capture Area for Tuna", # required
         System_shape_file = "tuna.shp",
         Area_code_official = "0") # required

data_orig18 <- st_read(file.path(basedir, "raw", "country", "mexico", "verdillo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Sea Bass", # required)
         System_code = "AXN NFC", # required
         System_code_localized = "AXN CNP",
         System_multispecies = "1",
         System_species_description = paste("Paralabrax nebulifer, Caulolatilus princeps"),
         Area_systematic_name_english = "Capture Area for Sea Bass", # required
         System_shape_file = "verdillo.shp",
         Area_code_official = "0") # required

data_orig19 <- st_read(file.path(basedir, "raw", "country", "mexico", "caracoles.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Conch", # required)
         System_code = "C NFC", # required
         System_code_localized = "C CNP",
         System_multispecies = "1",
         System_species_description = paste("Lobatus gigas, Turbinella angulata, Sinistrofulgur perversum, Triplofusus giganteus, Lobatus costatus"),
         Area_systematic_name_english = "Capture Area for Conch", # required
         System_shape_file = "caracoles.shp",
         Area_code_official = "0") # required

data_orig9 <- st_read(file.path(basedir, "raw", "country", "mexico", "huachinango.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Snapper", # required)
         System_code = "SNR NFC", # required
         System_code_localized = "SNR CNP",
         System_multispecies = "1",
         System_species_description = paste("Lutjanus sp."),
         Area_systematic_name_english = "Capture Area for Snapper", # required
         System_shape_file = "huachinango.shp",
         Area_code_official = "0") # required

data_orig8 <- st_read(file.path(basedir, "raw", "country", "mexico", "pulpo_pacifico.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Octopus in the Pacific", # required)
         System_code = "OP NFC", # required
         System_code_localized = "OP CNP",
         System_multispecies = "1",
         System_species_description = paste("Octopus sp."),
         Area_systematic_name_english = "Capture Area for Octopus", # required
         System_shape_file = "pulpo_pacifico.shp",
         Area_code_official = "0") # required

data_orig = list(data_orig1, data_orig2, data_orig3, data_orig4, data_orig5, data_orig6,
                 data_orig7, data_orig8, data_orig9, data_orig10, data_orig11, data_orig12,
                 data_orig13, data_orig14, data_orig15, data_orig16, data_orig17, data_orig18,
                 data_orig19) %>%
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
    System_source = "Diario Oficial de la Federación. (06 Nov 2018). ACUERDO por el que se da a conocer la actualización de la Carta Nacional Pesquera. (Continúa en la Tercera Sección). www.gob.mx/. Retrieved 13 July 2023: https://www.gob.mx/cms/uploads/attachment/file/334832/DOF_-_CNP_2017.pdf", # required
    System_source_date = "2018-11-06", # required
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on July 13 2023", # required
    System_type = "Capture Area", # required
    System_category = "Management Area", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_33.Rds"))
