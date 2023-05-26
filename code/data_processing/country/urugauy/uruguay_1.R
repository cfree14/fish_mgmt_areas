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
data_orig <- st_read(file.path(basedir, "raw", "country", "uruguay", "uruguay.shp")) %>%
  sf::st_transform(wgs84)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = geometry)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Ministry of Livestock, Agriculture and Fisheries National Directorate of Aquatic Resources", # required
    Owner_name_localized = "Ministerio de Ganadería, Agricultura y Pesca Dirección Nacional de Recursos Acuáticos", # preferred if no official translation unless not roman alphabet
    Owner_code = "NDAR", # required
    Owner_code_localized = "DINARA", # preferred if no official translation
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "ury",
    System_name_english = "Uruguayan Artisanal Fishing Zones", # required
    System_name_localized = "Zonas de pesca artesanal uruguayas",
    System_code = "AFZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Ministerio de Ganadería, Agricultura y Pesca Dirección Nacional de Recursos Acuáticos. (01 Jan 2019). Boletín Estadístico Pesquero 2018. www.gub.uy. Retrieved 12 May 2023: https://www.gub.uy/ministerio-ganaderia-agricultura-pesca/sites/ministerio-ganaderia-agricultura-pesca/files/2020-02/Bolet%C3%ADn%20Estad%C3%ADstico%20Pesquero%202016-2018.pdf", # required
    System_source_date = "2019-01-01", # required
    System_shape_file = "uruguay.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 12 2023", # required
    System_type = "Artisanal Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Artisanal Fishing Zone", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date(),
    System_georef_code = "Area_code"
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "uruguay", "uruguay_1.Rds"))
