library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig <- st_read(file.path(basedir, "raw", "rmfo", "fishery_committee_eastern_central_atlantic", "cecaf_sub.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry) %>% # required
  # add columns
  mutate(
    System_georef_code = "Area_code",
    Owner_name_english = "Fishery Committee for the Eastern Central Atlantic", # required
    Owner_code = "CECAF", # required
    Owner_code_official = "1", # required
    Owner_multinational = "1", # required
    System_name_english = "CECAF Areas", # required
    System_code = "CECAFA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_source = "European Commission, Joint Research Centre, Martinsohn, J., Neat, F., Jardim, E., et al., Deep sea, close kin : a genetic approach for improved fisheries management : close kin analysis based on genetics in support of improved management under the common fisheries policy : a feasibility assessment, Publications Office, 2016, https://data.europa.eu/doi/10.2788/277218", # required
    System_source_date = "2016-01-01", # required
    System_shape_file = "cecaf_sub.shp",
    System_license_terms = "Public Domain", # required
    Area_code_official = "1",
    Area_systematic_name_english = paste("CECAF Area", Area_code),
    System_lineage = "Digitized by Alicia Caughman in QGIS on August 7 2023", # required
    System_type = "Area Covered by CECAF", # required
    System_category = "Management Area", # required

    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "fishery_committee_eastern_central_atlantic", "cecaf_1.Rds"))
