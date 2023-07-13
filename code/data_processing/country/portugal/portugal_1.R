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
data_orig <- st_read(file.path(basedir, "raw", "country", "portugal", "portugal_2.shp")) %>%
  sf::st_transform(wgs84) %>%
  select(-Area_desc)

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
    Owner_name_english = "Portuguese Institute of the Sea and Atmosphere", # required
    Owner_name_localized = "Instituto Portugues do Mar e da Atmosfera",
    Owner_code = "PISA", # required
    Owner_code_localized = "IPMA",
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "prt",
    System_name_english = "Portuguese National Resource Zones and Subzones", # required
    System_name_localized = "Zonas e sub-zonas de captura dos recursos nacionais na costa continental portuguesa",
    System_code = "NRZ", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Instituto Portugues do Mar e da Atmosfera. (2020). Estado dos stocks em 2019 e aconselhamento científico para a sua gestão em 2020. ipma.pt. Retrieved 10 July 2023: https://www.ipma.pt/export/sites/ipma/bin/docs/publicacoes/pescas.mar/RA-estado.recursos.explorados.2020.pdf", # required
    System_source_date = "2020-01-01", # required
    System_shape_file = "portugal_2.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman on 10 July 2023", # required
    System_type = "Resource Zones", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    System_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_descriptive_name = c("Zona Ocidental Sul - Subzona Centro", "Zona Ocidental Sul - Subzona Costa Vicentina", "Zona Sul - Subzona Barlavento", "Zona Sul - Subzona Sota-Vento", "Zona Ocidental Norte")

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "portugal", "portugal_1.Rds"))
