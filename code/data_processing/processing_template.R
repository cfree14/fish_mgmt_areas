library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "XXX", "XXX.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry) %>% # required
  # add columns
  mutate(
    Owner_name_english = "", # required
    Owner_name_localized = "", # preferred if no official translation unless not roman alphabet
    Owner_code = "", # required
    Owner_code_localized = "", # preferred if no official translation
    Owner_code_official = "", # required
    Owner_multinational = "", # required
    Owner_country = "",
    System_name_english = "", # required
    System_name_localized = "",
    System_additional_descriptor = "",
    System_code = "", # required
    System_code_localized = "",
    System_code_official = "", # required
    System_code_disambiguation = "",
    System_multispecies = "",
    System_species_description = "",
    System_source = "", # required
    System_source_date = "", # required
    System_shape_file = "",
    System_georef_code = "",
    System_license_terms = "", # required
    System_lineage = "", # required
    System_comment = "",
    System_type = "", # required
    System_type_code = "",
    System_category = "", # required
    Area_systematic_name_english = "", # required
    Area_systematic_name_localized = "",
    Area_descriptive_name = "",
    Area_code = "", # required
    Area_code_official = "", # required
    Area_parent_area = "",
    Area_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "XXX", "XXX.Rds"))
