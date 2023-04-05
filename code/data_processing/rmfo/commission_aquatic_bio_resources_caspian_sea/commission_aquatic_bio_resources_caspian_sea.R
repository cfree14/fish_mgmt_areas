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
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "commission_aquatic_bio_resources_caspian_sea", "worldlakes.shp"))

# Format data
################################################################################

# Format data

# Author Surname or name of organisation, Author Firstname.
# (Date published or last revised). Title of webpage.
# Title of Website. Retrieved [Date Retrieved]
# from: website (e.g.: Ministry for Primary Industries (MPI). (10 Jan 2020).
# Quota Management Areas. Data.gov.nz.
# Retrieved 30 June 2022:
# https://mpi.maps.arcgis.com/home/item.html?id=83b5785c0f0b4da1a2c99dadeebdff0a)

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry) %>%
  rename(Area_code = objectid) %>%
  mutate(System_georef_code = "objectid") %>%
  rename(Area_systematic_name_english = name) %>%
  select(Area_systematic_name_english, geom, System_georef_code, Area_code)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Commission of Aquatic Bio-resources of the Caspian Sea", # required
    Owner_code = "CABRCS", # required
    Owner_code_official = "0", # required
    Owner_multinational = "1", # required
    System_name_english = "SABRCS Management Area", # required
    System_code = "SABRCS MA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "Marine Gazetteer Placedetails. (01 Jan 2005). Marine Regions; Caspian Sea. marineregions.org Retrieved 21 March 2023: http://marineregions.org/mrgid/4282", # required
    System_source_date = "2005-01-01", # required
    System_shape_file = "worldlakes.zip",
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "Retrieved from marineregions.org on 21 March 2023", # required
    System_type = "Caspian Lake Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "Caspian Lake", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "mexico", "commission_aquatic_bio_resources_caspian_sea.Rds"))
