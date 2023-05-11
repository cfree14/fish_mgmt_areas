library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- readRDS(file.path(basedir, "raw", "country", "suriname", "Suriname_fisheries_management_areas.RDS"))

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
         Area_code = zone_id,
         Area_systematic_name_english = zone_name,
         System_source = citation) %>%
  select(-country, -ocean, -region, -species, -created, -source, -type) %>% # required
  # add columns
  mutate(
    Owner_name_localized = "Ministerie van LVV",
    Owner_code_localized = "LVV", # preferred if no official translation
    Owner_code = "DALF",
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "sur",
    System_code = "SFMA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source_date = "2017-06-18", # required
    System_shape_file = "suriname_fisheries_areas.KML",
    System_georef_code = "zone_id",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Leonardo Feitosa in Google Earth Engine", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu; Leonardo Feitosa",
    Created_on = Sys.Date()
  )

data$Area_code = c(2:(nrow(data)+1))

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "suriname", "suriname_2.Rds"))
