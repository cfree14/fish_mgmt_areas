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
data_orig <- st_read(file.path(basedir, "raw", "country", "greece", "greece.shp")) %>%
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
    Owner_name_english = "Hellenic Statistical Authority of Greece", # required
    Owner_code = "HSAG", # required
    Owner_code_official = "0", # required
    Owner_multinational = "0", # required
    Owner_country = "grc",
    System_name_english = "Greece Fishing Sub-Areas", # required
    System_code = "FSA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Dimitrios K. Moutopoulos and Konstantinos I. Stergiou. (27 May 2014). The evolution of Greek fisheries during the 1928-1939 period. Retrieved 24 May 2023: http://jadran.izor.hr/acta/pdf/52_2_pdf/52_2_3.pdf", # required
    System_source_date = "2014-05-27", # required
    System_shape_file = "greece.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 24 2023", # required
    System_type = "Fishing Sub-Areas", # required
    System_category = "Statistical Area", # required
    Area_systematic_name_english = paste("Fishing Sub-Area", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "greece", "greece_1.Rds"))
