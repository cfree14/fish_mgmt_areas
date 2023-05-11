library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- readRDS(file.path(basedir, "raw", "country", "argentina", "Argentina_fisheries_mgmt_areas.RDS"))

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
         Area_systematic_name_english = zone_name,
         System_source = citation,
         System_species_description = species_list) %>%
  select(-country, -ocean, -region, -species, -created, -source, -type) %>% # required
  # add columns
  mutate(
    Owner_name_localized = "Ministerio de Agricultura, Ganadería y Pesca", # preferred if no official translation unless not roman alphabet
    Owner_code = "MAGyP", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "arg",
    System_code = "AFMA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source_date = "2022-06-07", # required
    System_shape_file = "argentina_1.KML",
    System_georef_code = "zone_id",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Leonardo Feitosa in Google Earth Engine", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_localized = "",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu; Leonardo Feitosa",
    Created_on = Sys.Date()
  ) %>%
  mutate(System_source = "Ministry of Agriculture, Cattle raising, and Fisheries of Argentina. (07 June 2022). Argentina fisheries management areas. https://www.magyp.gob.ar/sitio/. Retrieved 28 July 2022: https://www.magyp.gob.ar/sitio/areas/pesca_maritima/monitoreo/")

data$Area_code = c(1:nrow(data))

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "argentina", "argentina_1.Rds"))
