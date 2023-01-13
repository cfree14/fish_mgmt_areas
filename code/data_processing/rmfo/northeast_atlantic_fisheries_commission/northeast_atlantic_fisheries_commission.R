library(tidyverse)
library(sf)

# Setup
################################################################################

# https://www.neafc.org/managing_fisheries/measures/ra_map

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "NEAFC_map.KML"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  select(-Description)

ggplot(data = data) +
  geom_sf() +
  theme_bw()

# Author Surname or name of organisation, Author Firstname.
# (Date published or last revised). Title of webpage.
# Title of Website. Retrieved [Date Retrieved]
# from: website (e.g.: Ministry for Primary Industries (MPI). (10 Jan 2020).
# Quota Management Areas. Data.gov.nz.
# Retrieved 30 June 2022:
# https://mpi.maps.arcgis.com/home/item.html?id=83b5785c0f0b4da1a2c99dadeebdff0a)

data <- data %>%
  # rename to geom
  rename(geom = geometry) %>% # required
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
    System_source = "North-East Atlantic Fisheries Commision (NEAFC). (01 Jan 2011). Map of the NEAFC Regulatory Areas. www.neafc.org. Retrieved 01 Jan 2023: https://www.google.com/maps/d/u/0/viewer?ie=UTF8&hl=en&oe=UTF8&msa=0&num=200&t=m&ll=52.02545254989506%2C0.3515629999999632&spn=57.815791%2C96.503906&z=3&source=embed&mid=1FnL1ttZchoJ2Q-o2auWQKppzVf8", # required (copywrited 2011)
    System_source_date = "2011-01-01", # required
    System_shape_file = "", # I named this after downloading, do you want this?
    System_georef_code = "", # I'm not sure out this
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "Downloaded and imported from www.neafc.org on 03 Jan 2023", # required
    System_type = "Regulatory Area", # required IS THIS CORRECT
    System_category = "Regulatory Area",
    Area_code_official = "1", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  ) %>%
  select(-Name)

data$Area_systematic_name_english = c("NEAFC RA 1", "NEAFC RA 2", "NEAFC RA 3") # required
data$Area_descriptive_name = c("XRR Reykjanes Ridge", "XNS/ Banana Hole", "XBS/Loophole")
data$Area_code = c(1,2,3) # required

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission.Rds"))
