library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "fishery_committee_eastern_central_atlantic", "sardine.shp"))

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
    System_georef_code = "Area_code",
    Owner_name_english = "Fishery Committee for the Eastern Central Atlantic", # required
    Owner_code = "CECAF", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "CECAF Sardine Stock Zones", # required
    System_code = "CECAF SSZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "Sardines",
    System_source = "Bouanani, H., El Foutayeni, Y., & Khaladi, M. (2014). Estimation of biological and economic parameters of the sardine population: Case of the Moroccan Centre Atlantic. 17, 497–513. https://www.researchgate.net/publication/352401938_Estimation_of_biological_and_economic_parameters_of_the_sardine_population_Case_of_the_Moroccan_Centre_Atlantic#fullTextFileContent", # required
    System_source_date = "2014-01-01", # required
    System_shape_file = "sardine.shp",
    System_license_terms = "Public Domain", # required
    Area_systematic_name_english = paste("Sardine Stock Zone", Area_code),
    System_lineage = "Digitized by Alicia Caughman in QGIS on August 7 2023", # required
    System_type = "Stock Zone", # required
    System_category = "Management Area", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_code_official = c("0", "1", "1", "1")
data$Area_descriptive_name = c("Stock North", "Stock South", "Stock Central", "Stock Central")

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "fishery_committee_eastern_central_atlantic", "cecaf_2.Rds"))
