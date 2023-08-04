library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
attribute <- readRDS(file.path(basedir, "raw", "country", "colombia", "Colombia_Shrimp_Fisheries_Areas.RDS")) %>%
  as.data.frame() %>%
  select(-geometry) %>%
  distinct() %>%
  arrange(zone_id)
data_orig = st_read(file.path(basedir, "raw", "country", "colombia", "Colombia_Shrimp_Fisheries_Areas.shp")) %>%
  rename(geom = geometry,
         Area_code = gridcode) %>%
  arrange(Area_code) %>%
  select(Area_code, geom)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################


data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  mutate(Owner_name_localized = attribute$agency,
         System_name_english = attribute$dataset,
         System_name_localized = attribute$dataset_esp,
         Area_systematic_name_localized = attribute$zone_name,
         System_source = attribute$citation,
         System_species_description = attribute$species_list) %>%
  # add columns
  mutate(
    Owner_name_english = "National Aquaculture and Fisheries Authority", # preferred if no official translation unless not roman alphabe
    Owner_code = "AUNAP", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "col",
    System_code = "AUNAPSZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "Shrimp",
    System_source_date = "2021-11-21", # required
    System_shape_file = "Colombia_Shrimp_Fisheries_Areas.shp",
    System_georef_code = "gridcode",
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
