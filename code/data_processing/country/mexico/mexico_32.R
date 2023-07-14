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
data_orig1 <- st_read(file.path(basedir, "raw", "country", "mexico", "calamar.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Jumbo Flying Squid", # required)
         System_code = "GIS NFC", # required
         System_code_localized = "GIS CNP",
         System_multispecies = "0",
         System_species_description = paste("Dosidicus gigas"),
         Area_systematic_name_english = "Capture Area for Jumbo Flying Squid", # required
         System_shape_file = "calamar.shp",
         Area_code_official = "0") # required

data_orig2 <- st_read(file.path(basedir, "raw", "country", "mexico", "marlin.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Marlin", # required)
         System_code = "BLM NFC", # required
         System_code_localized = "BLM CNP",
         System_multispecies = "1",
         System_species_description = paste("Kajikia audax, Makaira mazara, Istiompax indica, Tetrapturus angustirostris"),
         Area_systematic_name_english = "Capture Area for Marlin", # required
         System_shape_file = "marlin.shp",
         Area_code_official = "0") # required

data_orig3 <- st_read(file.path(basedir, "raw", "country", "mexico", "merluza.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Hake", # required)
         System_code = "NHA NFC", # required
         System_code_localized = "NHA CNP",
         System_multispecies = "0",
         System_species_description = paste("Merluccius productus"),
         Area_systematic_name_english = "Capture Area for Hake", # required
         System_shape_file = "merluza.shp",
         Area_code_official = "0") # required

data_orig4 <- st_read(file.path(basedir, "raw", "country", "mexico", "pelagicos.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Small Pelagics", # required)
         System_code = "CHP NFC", # required
         System_code_localized = "CHP CNP",
         System_multispecies = "1",
         System_species_description = paste("Sardinops sagax, Engraulis mordax, Opisthonema libertate, Opisthonema bulleri, Opisthonema medirastre, Scomber japonicus, Cetengraulis mysticetus, Etrumeus teres, Trachurus symmetricus, Oligoplites refulgens, O. altus, O. saurus"),
         Area_systematic_name_english = "Capture Area for Small Pelagics", # required
         System_shape_file = "pelagicos.shp",
         Area_code_official = "0") # required

data_orig5 <- st_read(file.path(basedir, "raw", "country", "mexico", "bagres.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Catfish", # required)
         System_code = "BEM NFC", # required
         System_code_localized = "BEM CNP",
         System_multispecies = "1",
         System_species_description = paste("Bagre marinus, Ariopsis felis"),
         Area_systematic_name_english = "Capture Area for Catfish", # required
         System_shape_file = "bagres.shp",
         Area_code_official = "0") # required

data_orig6 <- st_read(file.path(basedir, "raw", "country", "mexico", "camaron_cafe.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Brown Shripm", # required)
         System_code = "BS NFC", # required
         System_code_localized = "BS CNP",
         System_multispecies = "0",
         System_species_description = paste("Farfantepenaeus aztecus"),
         Area_systematic_name_english = "Capture Area for Brown Shrimp", # required
         System_shape_file = "camaron_cafe.shp",
         Area_code_official = "1") # required

data_orig7 <- st_read(file.path(basedir, "raw", "country", "mexico", "camaron_rojo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Red Shrimp", # required)
         System_code = "RS NFC", # required
         System_code_localized = "RS CNP",
         System_multispecies = "1",
         System_species_description = paste("Farfantepenaeus brasiliensis, Sicyonia brevirostris"),
         Area_systematic_name_english = "Capture Area for Red Shrimp", # required
         System_shape_file = "camaron_rojo.shp",
         Area_code_official = "0") # required

data_orig8 <- st_read(file.path(basedir, "raw", "country", "mexico", "camaron_resado.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Pink Shrimp", # required)
         System_code = "PS NFC", # required
         System_code_localized = "PS CNP",
         System_multispecies = "0",
         System_species_description = paste("Farfantepenaeus duorarum"),
         Area_systematic_name_english = "Capture Area for Pink Shrimp", # required
         System_shape_file = "camaron_resado.shp",
         Area_code_official = "0") # required

data_orig9 <- st_read(file.path(basedir, "raw", "country", "mexico", "jaiba_gulfo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Crab in the Gulf of Mexico", # required)
         System_code = "CRB NFC", # required
         System_code_localized = "CRB CNP",
         System_multispecies = "1",
         System_species_description = paste("Callinectes sapidus, Callinectes rathbunae"),
         Area_systematic_name_english = "Capture Area for Crab", # required
         System_shape_file = "jaiba_gulfo.shp",
         Area_code_official = "1") # required

data_orig10 <- st_read(file.path(basedir, "raw", "country", "mexico", "jurel.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Jack", # required)
         System_code = "TAR NFC", # required
         System_code_localized = "TAR CNP",
         System_multispecies = "1",
         System_species_description = paste("Caranx hippos, Caranx latus, Caranx crysos"),
         Area_systematic_name_english = "Capture Area for Jack", # required
         System_shape_file = "jurel.shp",
         Area_code_official = "0") # required

data_orig11 <- st_read(file.path(basedir, "raw", "country", "mexico", "langosata_golfo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Herring", # required)
         System_code = "CVJ NFC", # required
         System_code_localized = "CVJ CNP",
         System_multispecies = "1",
         System_species_description = paste("Panulirus argus, Panulirus guttatus"),
         Area_systematic_name_english = "Capture Area for Herring", # required
         System_shape_file = "langosata_golfo.shp",
         Area_code_official = "1") # required

data_orig12 <- st_read(file.path(basedir, "raw", "country", "mexico", "lisa.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Mullet", # required)
         System_code = "MUF NFC", # required
         System_code_localized = "MUF CNP",
         System_multispecies = "1",
         System_species_description = paste("Mugil cephalus, Mugil curema"),
         Area_systematic_name_english = "Capture Area for Mullet", # required
         System_shape_file = "lisa.shp",
         Area_code_official = "0") # required

data_orig13 <- st_read(file.path(basedir, "raw", "country", "mexico", "mero.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Grouper", # required)
         System_code = "GPR NFC", # required
         System_code_localized = "GPR CNP",
         System_multispecies = "1",
         System_species_description = paste("Epinephelus morio, Mycteroperca bonaci"),
         Area_systematic_name_english = "Capture Area for Grouper", # required
         System_shape_file = "mero.shp",
         Area_code_official = "0") # required

data_orig14 <- st_read(file.path(basedir, "raw", "country", "mexico", "pepino_golfo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Herring", # required)
         System_code = "GPR NFC", # required
         System_code_localized = "GPR CNP",
         System_multispecies = "0",
         System_species_description = paste("Isostichopus badionotus"),
         Area_systematic_name_english = "Capture Area for Herring", # required
         System_shape_file = "pepino_golfo.shp",
         Area_code_official = "1") # required

data_orig15 <- st_read(file.path(basedir, "raw", "country", "mexico", "pulpo_golfo.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Sea Cucumber in the Gulf of Mexico", # required)
         System_code = "HIZ NFC", # required
         System_code_localized = "HIZ CNP",
         System_multispecies = "1",
         System_species_description = paste("Octopus maya, Octopus vulgaris, Octopus insularis"),
         Area_systematic_name_english = "Capture Area for Sea Cucumber", # required
         System_shape_file = "pulpo_golfo.shp",
         Area_code_official = "0") # required

data_orig16 <- st_read(file.path(basedir, "raw", "country", "mexico", "rayas.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Rays", # required)
         System_code = "MAE NFC", # required
         System_code_localized = "MAE CNP",
         System_multispecies = "1",
         System_species_description = paste("Hypanus americanus, Aetobatus narinar, Rhinoptera bonasus, Gymnura micrura, Pseudobatos lentiginosus, Styracura schmardae, Bathytoshia centroura"),
         Area_systematic_name_english = "Capture Area for Rays", # required
         System_shape_file = "rayas.shp",
         Area_code_official = "0") # required

data_orig17 <- st_read(file.path(basedir, "raw", "country", "mexico", "robalo_2.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Snook", # required)
         System_code = "SNO NFC", # required
         System_code_localized = "SNO CNP",
         System_multispecies = "1",
         System_species_description = paste("Centropomus undecimalis, Centropomus poey, Centropomus parallelus"),
         Area_systematic_name_english = "Capture Area for Snook", # required
         System_shape_file = "robalo_2.shp",
         Area_code_official = "0") # required

data_orig18 <- st_read(file.path(basedir, "raw", "country", "mexico", "sierra.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Mackerel", # required)
         System_code = "KGM NFC", # required
         System_code_localized = "KGM CNP",
         System_multispecies = "1",
         System_species_description = paste("Scomberomorus cavalla, Scomberomorus maculatus, Scomberomorus regalis"),
         Area_systematic_name_english = "Capture Area for Mackerel", # required
         System_shape_file = "sierra.shp",
         Area_code_official = "0") # required

data_orig19 <- st_read(file.path(basedir, "raw", "country", "mexico", "tiburones.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "National Fishing Card for Shark", # required)
         System_code = "CCL NFC", # required
         System_code_localized = "CCL CNP",
         System_multispecies = "1",
         System_species_description = paste("Rhizoprionodon terraenovae, Sphyrna tiburo, Carcharhinus sp., Sphyrna lewini"),
         Area_systematic_name_english = "Capture Area for Shark", # required
         System_shape_file = "tiburones.shp",
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
    System_source = "Diario Oficial de la Federación. (26 July 2022). SECRETARIA DE AGRICULTURA Y DESARROLLO RURAL. www.gob.mx/. Retrieved 13 July 2023: https://www.gob.mx/cms/uploads/attachment/file/763278/CNP_2022.pdf", # required
    System_source_date = "2022-07-26", # required
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on July 13 2023", # required
    System_type = "Capture Area", # required
    System_category = "Management Area", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "mexico_32.Rds"))
