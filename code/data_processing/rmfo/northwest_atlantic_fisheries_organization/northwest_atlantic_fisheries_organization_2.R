library(tidyverse)
library(sf)

# https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "northwest_atlantic_fisheries_organization", "NAFO_Divisions_2021_poly_clipped.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(geometry, Label)

data <- data %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry,
         georef_code = Label) %>% # required
  # add columns
  mutate(
    Owner_name_english = "Northwest Atlantic Fisheries Organization", # required
    Owner_code = "NAFO", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "NAFO Subareas, Divisions, and Subdivisions", # required
    System_code = "NAFO SDS", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Government of Canada. (2021). NAFO Subareas, Divisions, and Subdivision. open.canada.ca. Retrieved 07 Feb 2023: https://open.canada.ca/data/en/dataset/59af1c96-fc8f-4fa0-b398-d65e953eadaa", # required
    System_source_date = "2021-01-01", # required
    System_shape_file = "NAFO_Divisions_2021_SHP.zip/NAFO_Divisions_2021_poly_clipped.SHP",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from open.canada.ca on 07 Feb 2023", # required
    System_category = "Management Area", # required
    Area_code = georef_code, # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$System_type = c("Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Subdivision", "Subdivision", "Division", "Division", "Division", "Subdivision", "Subdivision", "Division", "Division", "Division", "Subsubdivision", "Subdivision", "Subsubdivision", "Subdivision", "Division", "Division", "Division", "Division", "Division", "Division", "Division", "Division") # required
data = data %>%
  mutate(Area_descriptive_name = paste("Subarea: ", data_orig$SubArea, "Division: ", data_orig$Division, "Subdivision: ", data_orig$SubDiv, "Subsubdivision: ", data_orig$SubSubDiv))

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "northwest_atlantic_fisheries_organization", "northwest_atlantic_fisheries_organization_2.Rds"))
