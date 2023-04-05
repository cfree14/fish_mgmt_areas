library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "RFB_NEAFC.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

sf_use_s2(FALSE)

# Format data
################################################################################

# Format data

### Data 1

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(geometry, OBJECTID)

data <- data %>%
  # rename to geom
  rename(geom = geometry,
         Area_code = OBJECTID) %>% # required
  # add columns
  mutate(
    System_georef_code = "OJBECTID",
    Owner_name_english = "North-East Atlantic Fisheries Commision", # required
    Owner_code = "NEAFC", # required
    Owner_code_official = 1, # required
    Owner_multinational = 1, # required
    System_name_english = "NEAFC Area of Competence", # required
    System_code = "NEAFCAoC", # required
    System_code_official = 0, # required
    System_multispecies = "1",
    System_source = "Food and Agriculture Organization (FAO). (30 Jan 2020). Geographic Area of Competence of North-East Atlantic Fisheries Commission (NEAFC). data.apps.fao.org. Retrieved 17 Jan 2023: https://data.apps.fao.org/map/catalog/srv/eng/catalog.search#/metadata/fao-rfb-map-neafc", # required
    System_source_date = "2020-01-30", # required
    System_shape_file = "RFB_NEAFC.zip", #required
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from data.apps.fao.org on 17 Jan 2023", # required
    System_type = "Area of Competence", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date(),
    Area_systematic_name_english = "NEAFC Area of competence 4",
    System_georef_code = as.character(System_georef_code),
    Area_descriptive_name = ""
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission_2.Rds"))
