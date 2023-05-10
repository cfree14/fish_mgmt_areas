library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- readRDS(file.path(basedir, "raw", "country", "colombia", "Colombia_Shrimp_Fisheries_Areas.RDS"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################


data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry,
         Owner_name_localized = agency,
         System_name_english = dataset,
         System_name_localized = dataset_esp,
         Area_code = zone_id,
         Area_systematic_name_localized = zone_name,
         System_source = citation,
         System_species_description = species_list) %>%
  select(-country, -ocean, -region, -species, -created, -source, -type) %>% # required
  # add columns
  mutate(
    Owner_name_english = "National Aquaculture and Fisheries Authority", # preferred if no official translation unless not roman alphabe
    Owner_code_localized = "AUNAP", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "col",
    System_code = "AUNAPSZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "Shrimp",
    System_source_date = "2021-11-21", # required
    System_shape_file = "NA",
    System_georef_code = "zone_id",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Leonardo Feitosa in Google Earth Engine", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "",
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu; Leonardo Feitosa",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "colombia", "colombia_1.Rds"))
