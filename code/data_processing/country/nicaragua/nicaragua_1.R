library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig1 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_lobster.RDS"))
data_orig2 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_pacific_coast.RDS"))
data_orig3 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_queen_conch.RDS"))
data_orig4 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_sea_cucumber.RDS"))
data_orig5 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_shrimp.RDS"))
data_orig6 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_snapper.RDS"))
data_orig7 <- readRDS(file.path(basedir, "raw", "country", "nicaragua", "Nicaragua_tuna.RDS"))

data_orig = list(data_orig1, data_orig2, data_orig3, data_orig4, data_orig5, data_orig6, data_orig7) %>%
  reduce(rbind)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################


data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry,
         Owner_name_english = agency,
         System_name_english = dataset,
         System_name_localized = dataset_esp,
         Area_code = zone_id,
         Area_systematic_name_localized = zone_name,
         System_source = citation) %>%
  select(-country, -ocean, -region, -created, -species, -source, -type, -species_list) %>% # required
  # add columns
  mutate(
    Owner_name_localized = "Instituto Nicaraguense de Pesca y Acuicultura",
    Owner_code = "INPESCA", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "nic",
    System_code = "NFZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source_date = "2022-03-02", # required
    System_shape_file = "NA",
    System_georef_code = "zone_id",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Leonardo Feitosa in Google Earth Engine", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu; Leonardo Feitosa",
    Created_on = Sys.Date()
  )

data$Area_code = c(1:nrow(data))
data$System_species_description = c(0, 1, 1, 1, 1, 0, 0, 0, 0, 0)

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "nicaragua", "nicaragua_1.Rds"))
