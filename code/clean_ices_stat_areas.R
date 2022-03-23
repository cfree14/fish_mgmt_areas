


# Clear workspace
rm(list = ls())

# Setup
################################################################################

# Packages
library(tidyverse)

# Directories
basedir <- "/Volumes/GoogleDrive/My Drive/current-projects/fish_mgmt_areas/data/"
indir <- file.path(basedir, "ices_stat_areas", "raw")
outdir <- file.path(basedir, "ices_stat_areas", "processed")

# Read data
data_orig <- sf::st_read(file.path(indir, "ICES_Areas_20160601_cut_dense_3857.shp"))

# Projection
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")


# Format data
################################################################################

# Format data
data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # Rename
  rename(zone_id=Area_27) %>%
  # Add
  mutate(dataset="ICES Statistical Areas",
         country="Multinational",
         ocean="Atlantic",
         region="Europe",
         zone_name="",
         species="multi-species",
         source="https://gis.ices.dk/geonetwork/srv/api/records/c784a0a3-752f-4b50-b02f-f225f6c815eb") %>%
  # Arrange
  select(dataset, country, ocean, region, zone_id, zone_name, species, source)


# Export data
################################################################################

# Export
saveRDS(data, file=file.path(outdir, "ICES_statistical_areas.Rds"))











