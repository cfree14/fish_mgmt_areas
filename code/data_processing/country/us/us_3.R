library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "us", "bering_sea.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry) %>%
  mutate(System_georef_code = "Area_code")

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "United States of America", # required
    Owner_code = "USA", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "usa",
    System_name_english = "Bering Sea and Aleutian Islands Statistical and Reporting Areas", # required
    System_code = "SRA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Code of Federal Regulations. (10 July 2023). Figure 1 to Part 679, Title 50. ecfr.gov. Retrieved 12 July 2023: https://www.ecfr.gov/current/title-50/chapter-VI/part-679/appendix-Figure%201%20to%20Part%20679", # required
    System_source_date = "2023-07-10", # required
    System_shape_file = "bering_sea.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on July 12 2023", # required
    System_type = "Statstical and Reporting Area", # required
    System_category = "Statstical Area", # required
    Area_systematic_name_english = paste("Alaska National Marine Fisheries Service Reporting Area", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "us", "us_3.Rds"))
