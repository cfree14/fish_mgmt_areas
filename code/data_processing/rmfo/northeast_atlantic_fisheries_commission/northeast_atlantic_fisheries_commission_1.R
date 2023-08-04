library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig1 <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "NEAFC_map.KML"), layer = c("NEAFC RAs 40%"))
data_orig2 <- st_read(file.path(basedir, "raw", "rmfo", "northeast_atlantic_fisheries_commission", "NEAFC_map.KML"), layer = c("Existing Fishing Areas 2014"))
data_orig <- rbind(data_orig1, data_orig2)

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
  select(-Description, -Name) %>%
  st_zm(drop = TRUE, what = "ZM") # remove z dimension

data <- data %>%
  # rename to geom
  rename(
    geom = geometry
  ) %>% # required
  # add columns
  mutate(
    System_georef_code = "Name",
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
    System_shape_file = "Map of NEAFC Regulatory Area VME Closures and Existing Fishing Areas.KML", # required
    System_license_terms = "Not explicit/unknown", # required
    System_lineage = "Downloaded and imported from www.neafc.org on 03 Jan 2023", # required
    System_category = "Management Area", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

data$Area_systematic_name_english <- c("NEAFC RA 1", "NEAFC RA 2", "NEAFC RA 3", "Reykjanes Ridge Existing Area", "HAR 1", "HAR 2", "HAR 3", "HAR 4", "HAR 5", "MAR1", "MAR2", "MAR3", "MAR4", "MAR5", "Josephine Seamount 1") # required
data$Area_descriptive_name <- c("XRR Reykjanes Ridge", "XNS/ Banana Hole", "XBS/Loophole", "Reykjanes Ridge", "On the Hatton Bank", "On the Hatton Bank", "On the Hatton Bank", "On the Hatton Bank", "On the Hatton Bank", "In the Mid-Atlantic", "In the Mid-Atlantic", "In the Mid-Atlantic", "In the Mid-Atlantic", "In the Mid-Atlantic", "Josephine Seamount")
data$Area_code <- c(1, 2, 3, 6, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 7) # required
data$Area_code_official <- c("1", "1", "1", "0", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "0") # required
data$System_type = c(rep("Regulatory Area", 3), rep("Existing Bottom Fishing Area", 12)) # required

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission_1.Rds"))
