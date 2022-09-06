


# Clear workspace
rm(list = ls())

# Setup
################################################################################

# Packages
library(tidyverse)

# Directories
datadir <- "data"
plotdir <- "figures"

# Read data
data_orig <- sf::st_read(file.path(datadir, "SOAU_and_MU_shapefiles.geojson"))

# Get world
world <- rnaturalearth::ne_countries(scale="small", returnclass = "sf")

# Reproject data
data <- data_orig %>%
  sf::st_transform(sf::st_crs(world))

# Plot data
################################################################################

# Plot data
g <- ggplot() +
  # Plot world
  geom_sf(data=world, fill="grey80", color="white", lwd=0.1) +
  # Plot boundaries
  geom_sf(data=data, fill=NA, color="grey30", lwd=0.1) +
  # Labels
  labs(x="Current FishSource spatial database") +
  # Theme
  theme_bw()
g
