library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "macedonia", "lake_prespa.shp"))

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
    Owner_name_english = "NA", # required
    Owner_code = "NA", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    System_name_english = "Lake Prespa", # required
    Owner_country = "mkd",
    System_code = "LP", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Wikipedia (2023). Lake Prespa. en.wikipedia.org. Retrived on 10 July 2023 at https://en.wikipedia.org/wiki/Lake_Prespa", # required
    System_source_date = "2023-01-01", # required
    System_shape_file = "lake_prespa.shp",
    System_georef_code = "Area_code",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman on 10 July 2023", # required
    System_type = "Lake Area", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_descriptive_name = c("Small Prespa", "Lake Prespa")

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "macedonia", "macedonia_1.Rds"))
