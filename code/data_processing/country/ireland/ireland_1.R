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
data_orig1 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_1.shp")) %>%
  sf::st_transform(wgs84)
data_orig2 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_2.shp")) %>%
  sf::st_transform(wgs84)
data_orig3 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_3.shp")) %>%
  sf::st_transform(wgs84)
data_orig4 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_4.shp")) %>%
  sf::st_transform(wgs84)
data_orig5 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_5.shp")) %>%
  sf::st_transform(wgs84)
data_orig6 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_6.shp")) %>%
  sf::st_transform(wgs84)
data_orig7 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_7.shp")) %>%
  sf::st_transform(wgs84)
data_orig8 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_8.shp")) %>%
  sf::st_transform(wgs84)
data_orig9 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_9.shp")) %>%
  sf::st_transform(wgs84)
data_orig10 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_10.shp")) %>%
  sf::st_transform(wgs84)
data_orig11 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_11.shp")) %>%
  sf::st_transform(wgs84)
data_orig12 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_12.shp")) %>%
  sf::st_transform(wgs84)
data_orig13 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_13.shp")) %>%
  sf::st_transform(wgs84)
data_orig14 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_14.shp")) %>%
  sf::st_transform(wgs84)
data_orig15 <- st_read(file.path(basedir, "raw", "country", "ireland", "ireland_15.shp")) %>%
  sf::st_transform(wgs84)

data_orig = list(data_orig1, data_orig2, data_orig3, data_orig4, data_orig5, data_orig6,
                 data_orig7, data_orig8, data_orig9, data_orig10, data_orig11, data_orig12,
                 data_orig13, data_orig14, data_orig15) %>%
  reduce(rbind)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry,
         System_species_description = Species,
         Area_systematic_name_english = Area_descr)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Marine Institute and the Sea Fisheries Protection Authority", # required
    Owner_code = "MISFPA", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "irl",
    System_name_english = "Irish Total Allowable Catch Zones", # required
    System_code = "TACZ", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_source = "Marine Institute and the Sea Fisheries Protection Authority. (01 May 2022). FISHERIES FACTSHEET May 2022. assets.gov.ie. Retrieved 24 May 2023: https://assets.gov.ie/222709/1cf5b8e8-2fa4-4b59-802a-9d2ad34dedbd.pdf", # required
    System_source_date = "2022-05-01", # required
    System_shape_file = "ireland_1-15.shps",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 24 2023", # required
    System_type = "Total Allowable Catch Zones", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date(),
    System_georef_code = "Area_code"
  )

data$System_ASFIS = c(rep("WHG",3),"", "WHB", rep("PLE", 5), rep("RFE", 5), rep("POK", 4),
                      "HKE", rep("HOM", 2), rep("MEG", 2), "", rep("MNZ",2),
                      rep("COD", 4), rep("HAD", 4), rep("", 4))

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "ireland", "ireland_1.Rds"))
