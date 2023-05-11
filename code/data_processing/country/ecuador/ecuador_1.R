library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig1 <- readRDS(file.path(basedir, "raw", "country", "ecuador", "Ecuador_artisanal.RDS"))
data_orig2 <- readRDS(file.path(basedir, "raw", "country", "ecuador", "Ecuador_purse_seine_large.RDS")) %>%
  mutate(zone_id = c(1:3))
data_orig3 <- readRDS(file.path(basedir, "raw", "country", "ecuador", "Ecuador_purse_seine_small.RDS"))
data_orig4 <- readRDS(file.path(basedir, "raw", "country", "ecuador", "Ecuador_purse_seine_small_and_large.RDS"))
data_orig5 <- readRDS(file.path(basedir, "raw", "country", "ecuador", "Ecuador_trawl.RDS"))

data_orig = list(data_orig1, data_orig2, data_orig3, data_orig4, data_orig5) %>%
  reduce(rbind)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################


data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geo
  rename(geom = geometry,
         Owner_name_localized = agency,
         System_name_english = dataset,
         System_name_localized = dataset_esp,
         Area_code = zone_id,
         Area_systematic_name_english = zone_name,
         System_species_description = species_list,
         System_source = citation) %>%
  select(-country, -ocean, -region, -species, -created, -source, -type) %>% # required
  # add columns
  mutate(
    Owner_name_english = "National Secretariat of Planning", # preferred if no official translation unless not roman alphabet
    Owner_code_localized= "SENPLADES",
    Owner_code = "NSP",
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "ecu",
    System_code = "EFA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_shape_file = "NA",
    System_georef_code = "zone_id",
    System_source_date = "2022-06-23",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Leonardo Feitosa in Google Earth Engine", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu; Leonardo Feitosa",
    Created_on = Sys.Date()
  )


data$Area_code_official = c(rep("1", 11), rep("0", 3), rep("1", 2), rep("1", 15), rep("1", 4))


# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "ecuador", "ecuador_1.Rds"))
