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
data_orig <- st_read(file.path(basedir, "raw", "country", "greenland", "greenland_3.shp")) %>%
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
    Owner_multinational = "0", # required
    Owner_country = "grl",
    System_name_english = "Greenland Survey Area", # required
    System_code = "SA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "International Council for the Exploration of the Sea. (04 Oct 2021). ICES Advice on fishing opportunities, catch, and effort: Iceland Sea and Greenland Sea ecoregions. ices-library.figshare.com. Retrieved 25 May 2023: https://ices-library.figshare.com/articles/report/Beaked_redfish_Sebastes_mentella_in_ICES_subareas_5_12_and_14_Iceland_and_Faroes_grounds_north_of_Azores_east_of_Greenland_and_in_NAFO_subareas_1_and_2_shallow_pelagic_stock_500_m_/18639479?backTo=/collections/ICES_Advice_2021/5796932", # required
    System_source_date = "2021-10-04", # required
    System_shape_file = "greenland_3.shp",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Alicia Caughman in QGIS on May 26 2023", # required
    System_type = "Greenland ICES Assessment Area", # required
    System_category = "Assessment Area", # required
    Area_systematic_name_english = paste("ICES Survey Area", Area_code), # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "greenland", "greenland_1.Rds"))
