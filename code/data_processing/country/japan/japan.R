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
data_orig1 <- st_read(file.path(basedir, "raw", "country", "japan", "atka_mackerel.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Atka Mackerel Assessment Area", # required)
         System_code = "HUM FSA", # required
         System_ASFIS = "HUM",
         System_species_description = paste("Pleurogrammus monopterygius"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "atka_mackerel.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 07 2023") # required

data_orig2 <- st_read(file.path(basedir, "raw", "country", "japan", "bluefin_trevally.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Bluefin Trevally Assessment Area", # required)
         System_code = "NXM FSA", # required
         System_ASFIS = "NXM",
         System_species_description = paste("Caranx melampygus"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "bluefin_trevally.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 07 2023") # required

data_orig3 <- st_read(file.path(basedir, "raw", "country", "japan", "flathead_flounder.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Flathead Flounder Assessment Area", # required)
         System_code = "HGD FSA", # required
         System_ASFIS = "HGD",
         System_species_description = paste("Hippoglossoides dubius"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "flathead_flounder.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig4 <- st_read(file.path(basedir, "raw", "country", "japan", "horse_mackerel_pacific.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Horse Mackerel in the Pacific Assessment Area", # required)
         System_code = "JAX P FSA", # required
         System_ASFIS = "JAX",
         System_species_description = paste("Trachurus spp"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "horse_mackerel_pacific.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig5 <- st_read(file.path(basedir, "raw", "country", "japan", "horse_mackerel_tsushima.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Horse Mackerel in Tsushima Assessment Area", # required)
         System_code = "JAX T FSA", # required
         System_ASFIS = "JAX",
         System_species_description = paste("Trachurus spp"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "horse_mackerel_tsushima.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig6 <- st_read(file.path(basedir, "raw", "country", "japan", "kinmedai.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Kinmedai Assessment Area", # required)
         System_code = "BYS FSA", # required
         System_ASFIS = "BYS",
         System_species_description = paste("Beryx splendens"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "kinmedai.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig7 <- st_read(file.path(basedir, "raw", "country", "japan", "mackerel_pacific.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Mackerel in the Pacific Assessment Area", # required)
         System_code = "JAX2 P FSA", # required
         System_ASFIS = "JAX",
         System_species_description = paste("Trachurus spp"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "mackerel_pacific.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig10 <- st_read(file.path(basedir, "raw", "country", "japan", "mackerel_tsushima.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Mackerel in Tsushima Assessment Area", # required)
         System_code = "JAX2 T FSA", # required
         System_ASFIS = "JAX",
         System_species_description = paste("Trachurus spp"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "mackerel_tsushima.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig11 <- st_read(file.path(basedir, "raw", "country", "japan", "madara_hokkaido_pacific.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Cod in the Pacific Assessment Area", # required)
         System_code = "PCO P FSA", # required
         System_ASFIS = "PCO",
         System_species_description = paste("Gadus macrocephalus"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "madara_hokkaido_pacific.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig12 <- st_read(file.path(basedir, "raw", "country", "japan", "nigis.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Nigis Assessment Area", # required)
         System_code = "N FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Nigis"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "nigis.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig13 <- st_read(file.path(basedir, "raw", "country", "japan", "yellowtail.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Yellowtail Assessment Area", # required)
         System_code = "YT FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Yellowtail"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "yellowtail.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig14 <- st_read(file.path(basedir, "raw", "country", "japan", "madara_honshu_sea.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Cod in the Honshu Sea Assessment Area", # required)
         System_code = "PCO HS FSA", # required
         System_ASFIS = "PCO",
         System_species_description = paste("Gadus macrocephalus"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "madara_honshu_sea.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig15 <- st_read(file.path(basedir, "raw", "country", "japan", "madara_honsu.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Cod in the Honshu Assessment Area", # required)
         System_code = "PCO H FSA", # required
         System_ASFIS = "PCO",
         System_species_description = paste("Gadus macrocephalus"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "madara_honsu.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig16 <- st_read(file.path(basedir, "raw", "country", "japan", "maradara_hokkaido_sea.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Cod in the Hokkaido Sea Assessment Area", # required)
         System_code = "PCO HS FSA", # required
         System_ASFIS = "PCO",
         System_species_description = paste("Gadus macrocephalus"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "maradara_hokkaido_sea.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig17 <- st_read(file.path(basedir, "raw", "country", "japan", "magalay.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Magalay Assessment Area", # required)
         System_code = "M FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Magalay"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "magalay.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig18 <- st_read(file.path(basedir, "raw", "country", "japan", "maraji.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Maraji Assessment Area", # required)
         System_code = "M2 FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Maraji"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "maraji.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig19 <- st_read(file.path(basedir, "raw", "country", "japan", "mussel_flounder.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Mussel Flounder Assessment Area", # required)
         System_code = "MS FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Mussel Flounder"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "mussel_flounder.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 09 2023") # required

data_orig9 <- st_read(file.path(basedir, "raw", "country", "japan", "red_snow_crab.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Red Snow Crab Assessment Area", # required)
         System_code = "PCR FSA", # required
         System_ASFIS = "PCR",
         System_species_description = paste("Chionoecetes Japonicus"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "red_snow_crab.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig8 <- st_read(file.path(basedir, "raw", "country", "japan", "round_sarding_tsushima.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Round Sardine in Tsushima Assessment Area", # required)
         System_code = "SAA T FSA", # required
         System_ASFIS = "SAA",
         System_species_description = paste("Sardinella aurita"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "round_sarding_tsushima.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig20 <- st_read(file.path(basedir, "raw", "country", "japan", "round_sardine_pacific.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Round Sardine in the Pacific Assessment Area", # required)
         System_code = "SAA P FSA", # required
         System_ASFIS = "SAA",
         System_species_description = paste("Sardinella aurita"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "round_sardine_pacific.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig21 <- st_read(file.path(basedir, "raw", "country", "japan", "sand_locust.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Sand Locust Assessment Area", # required)
         System_code = "PF FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Psinidia fenestralis"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "sand_locust.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig22 <- st_read(file.path(basedir, "raw", "country", "japan", "shark_ray.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Shark Ray Assessment Area", # required)
         System_code = "SR FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Shark Ray"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "shark_ray.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig23 <- st_read(file.path(basedir, "raw", "country", "japan", "snow_crab_hokkaido.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Snow Crab in Hokkaido Assessment Area", # required)
         System_code = "CRQ H FSA", # required
         System_ASFIS = "CRQ",
         System_species_description = paste("Chionoecetes opilio"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "snow_crab_hokkaido.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig24 <- st_read(file.path(basedir, "raw", "country", "japan", "snow_crab_north_pacific.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Snow Crab in the North Pacific Assessment Area", # required)
         System_code = "CRQ NP FSA", # required
         System_ASFIS = "CRQ",
         System_species_description = paste("Chionoecetes opilio"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "snow_crab_north_pacific.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig25 <- st_read(file.path(basedir, "raw", "country", "japan", "willow_flounder.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Willow Flounder Assessment Area", # required)
         System_code = "WF FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Tanakius kitaharae"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "willow_flounder.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig26 <- st_read(file.path(basedir, "raw", "country", "japan", "snow_crab_okhostk.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Snow Crab in Okhostk Assessment Area", # required)
         System_code = "CRQ O FSA", # required
         System_ASFIS = "CRQ",
         System_species_description = paste("Chionoecetes opilio"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "snow_crab_okhostk.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig27 <- st_read(file.path(basedir, "raw", "country", "japan", "snow_crab_subA.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Snow Crab Assessment Area A", # required)
         System_code = "CRQ FSA A", # required
         System_ASFIS = "CRQ",
         System_species_description = paste("Chionoecetes opilio"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "snow_crab_subA.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig28 <- st_read(file.path(basedir, "raw", "country", "japan", "snow_crab_subB.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Snow Crab Assessment Area B", # required)
         System_code = "CRQ FSA B", # required
         System_ASFIS = "CRQ",
         System_species_description = paste("Chionoecetes opilio"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "snow_crab_subB.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig29 <- st_read(file.path(basedir, "raw", "country", "japan", "souhachi_hokkaido.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Souchachi in Hokkaido Assessment Area", # required)
         System_code = "CJJ H FSA", # required
         System_ASFIS = "CJJ",
         System_species_description = paste("Cleisthenes pinetorum"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "souhachi_hokkaido.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig30 <- st_read(file.path(basedir, "raw", "country", "japan", "souhachi_south.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Souhachi in South Sea of Japan Assessment Area", # required)
         System_code = "CJJ SJ FSA", # required
         System_ASFIS = "CJJ",
         System_species_description = paste("Cleisthenes pinetorum"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "souhachi_south.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig31 <- st_read(file.path(basedir, "raw", "country", "japan", "spanish_mackerel_sea.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Spanish Mackerel in the Sea of Japan Assessment Area", # required)
         System_code = "NPH SJ FSA", # required
         System_ASFIS = "NPH",
         System_species_description = paste("Scomberomorus niphonius"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "spanish_mackerel_sea.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig32 <- st_read(file.path(basedir, "raw", "country", "japan", "spanish_mackerel_seto.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Spanish Mackerel in Seto Assessment Area", # required)
         System_code = "NPH S FSA", # required
         System_ASFIS = "NPH",
         System_species_description = paste("Scomberomorus niphonius"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "spanish_mackerel_seto.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig33 <- st_read(file.path(basedir, "raw", "country", "japan", "tiger_puffer_ise.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Tiger Puffer in the Ise-Mikawawan system Assessment Area", # required)
         System_code = "TG IM FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Takifugu rubripes"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "tiger_puffer_ise.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig34 <- st_read(file.path(basedir, "raw", "country", "japan", "tiger_puffer_sea.shp")) %>%
  sf::st_transform(wgs84) %>%
  mutate(System_name_english = "Tiger Puffer in the Sea of Japan Assessment Area", # required)
         System_code = "TG SJ FSA", # required
         System_ASFIS = "",
         System_species_description = paste("Takifugu rubripes"),
         Area_systematic_name_english = paste("Assesment Area", Area_code), # required
         System_shape_file = "tiger_puffer_sea.shp",
         System_lineage = "Digitized by Alicia Caughman in QGIS on August 10 2023") # required

data_orig = list(data_orig1, data_orig2, data_orig3, data_orig4, data_orig5, data_orig6,
                 data_orig7, data_orig8, data_orig9, data_orig10, data_orig11, data_orig12,
                 data_orig13, data_orig14, data_orig15, data_orig16, data_orig17, data_orig18,
                 data_orig19, data_orig20, data_orig21, data_orig22, data_orig23, data_orig24,
                 data_orig25, data_orig26, data_orig27, data_orig28, data_orig29, data_orig30,
                 data_orig31, data_orig32, data_orig33, data_orig34) %>%
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
    Owner_name_english = " Fisheries Agency of Japan", # required
    Owner_name_localized = "教育機構　水産資源研究所", # preferred if no official translation unless not roman alphabet
    Owner_code = "FAJ", # required
    Owner_code_localized = "FRA", # preferred if no official translation
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    System_multispecies = "0",
    Owner_country = "jpn",
    System_code_official = "0", # required
    System_source = "Fisheries Agency of Japan and Japan Fisheries Research and Education Agency. (2022). Marine resources assessment results: 2022 fish stock assessment. www.abchan.fra.go.jp/. Retrieved 7 August 2023: https://abchan.fra.go.jp/hyouka/doc2022/", # required
    System_source_date = "2022-01-01", # required
    System_license_terms = "Public Domain", # required
    System_type = "Stock Assessment Area", # required
    System_category = "Assessment Area", # required
    Area_code_official = "0",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "japan", "japan.Rds"))

