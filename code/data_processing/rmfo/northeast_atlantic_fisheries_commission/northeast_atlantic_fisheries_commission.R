library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
data_orig1 <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "NEAFC_map.KML"))
data_orig2 <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "RFB_NEAFC.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

sf_use_s2(FALSE)

# Format data
################################################################################

# Format data

### Data 1

data1 <- data_orig1 %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(-Description) %>%
  st_zm(drop = TRUE, what = "ZM") #remove z dimension

data1 <- data1 %>%
  # rename to geom
  rename(geom = geometry, #required
         georef_code = Name) %>% # required
  # add columns
  mutate(
    Owner_name_english = "North-East Atlantic Fisheries Commision", # required
    Owner_code = "NEAFC", # required
    Owner_code_official = 1, # required
    Owner_multinational = 1, # required
    System_name_english = "NEAFC Regulatory Areas", # required
    System_code = "NEAFCRA", # required
    System_code_official = 0, # required
    System_multispecies = "1",
    System_source = "North-East Atlantic Fisheries Commision (NEAFC). (01 Jan 2011). Map of the NEAFC Regulatory Areas. www.neafc.org. Retrieved 03 Jan 2023: https://www.google.com/maps/d/u/0/viewer?ie=UTF8&hl=en&oe=UTF8&msa=0&num=200&t=m&ll=52.02545254989506%2C0.3515629999999632&spn=57.815791%2C96.503906&z=3&source=embed&mid=1FnL1ttZchoJ2Q-o2auWQKppzVf8", # required
    System_source_date = "2011-01-01", # required
    System_shape_file = "Map of NEAFC Regulatory Area VME Closures and Existing Fishing Areas.KML", #required
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "Downloaded and imported from www.neafc.org on 03 Jan 2023", # required
    System_type = "Regulatory Area", # required
    System_category = "Management Area", # required
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data1$Area_systematic_name_english <- c("NEAFC RA 1", "NEAFC RA 2", "NEAFC RA 3") # required
data1$Area_descriptive_name <- c("XRR Reykjanes Ridge", "XNS/ Banana Hole", "XBS/Loophole")
data1$Area_code <- c(1, 2, 3) # required

### DATA 2

data2 <- data_orig2 %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(geometry, OBJECTID)

data2 <- data2 %>%
  # rename to geom
  rename(geom = geometry, #required
         georef_code = OBJECTID) %>% # required
  # add columns
  mutate(
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
    Area_code = georef_code,
    Area_systematic_name_english = "NEAFC Regulatory Area 1",
    georef_code = as.character(georef_code),
    Area_descriptive_name = ""
  )

# Merge System

data = rbind(data1, data2)

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission.Rds"))
