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
data_orig <- st_read(file.path(basedir, "raw", "country", "portugal", "portugal.shp")) %>%
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
    Owner_name_english = "International Council for the Exploration of the Sea", # required
    Owner_code = "ICES", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "Anchovy in Division 9.a", # required
    System_code = "Div 9.a", # required
    System_code_official = "0", # required
    System_multispecies = "0",
    System_species_description = "Engraulis encrasicolus",
    System_source = "International Council for the Exploration of the Sea. (17 June 2022). ICES Advice on fishing opportunities, catch, and effort Bay of Biscay and the Iberian Coast ecoregion. ices-library.figshare.com. Retrieved 25 May 2023: https://ices-library.figshare.com/articles/report/Anchovy_Engraulis_encrasicolus_in_Division_9_a_Atlantic_Iberian_waters_/19447751?backTo=/collections/ICES_Advice_2022/5796935", # required
    System_source_date = "2022-06-17", # required
    System_shape_file = "portugal.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # require
    System_type = "Anchovy in ICES Division 9.a", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = paste("Inchovy in ICES Divison", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "ices", "ices_1.Rds"))
