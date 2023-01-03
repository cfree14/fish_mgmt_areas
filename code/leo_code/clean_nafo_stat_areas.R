


# Clear workspace
rm(list = ls())

# Setup
################################################################################

# Packages
library(sf)
library(tidyverse)

# Directories
basedir <- "/Volumes/GoogleDrive/My Drive/current-projects/fish_mgmt_areas/data"
indir <- file.path(basedir, "nafo_stat_areas", "raw", "NAFO_Divisions_SHP")
outdir <- file.path(basedir, "nafo_stat_areas", "processed")
plotdir <- "figures"

# Read data data
data_orig <- sf::st_read(file.path(indir, "NAFO_Divisions_2021_poly_clipped.shp"))

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")


# Build data
################################################################################

# Inspect attribute table
head(data_orig)
df <- data_orig %>%
  sf::st_drop_geometry()

# Format data
data <- data_orig %>%
  # Add columns
  mutate(dataset="NAFO Statistical Areas",
         country="USA/Canada",
         ocean="Atlantic",
         region="NE Atlantic",
         agency="NAFO",
         zone_name=NA,
         species="multi-species",
         source="https://www.nafo.int/Data/GIS") %>%
  # Rename columns
  rename(zone_id=Label) %>%
  # Arrange columns
  select(dataset, country, ocean, region, agency, zone_id, zone_name, species, source) %>%
  # Reproject
  sf::st_transform(wgs84)

# Export
saveRDS(data, file=file.path(outdir, "NAFO_statistical_areas.Rds"))



# Mapping examples

g <- ggplot() +
  geom_sf(data=data, color="black", fill=NA)
g


