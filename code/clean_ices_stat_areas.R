


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
plotdir <- "figures"

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
         zone_name="unnamed",
         species="multi-species",
         source="https://gis.ices.dk/geonetwork/srv/api/records/c784a0a3-752f-4b50-b02f-f225f6c815eb") %>%
  # Arrange
  select(dataset, country, ocean, region, zone_id, zone_name, species, source)


# Export data
################################################################################

# Export
saveRDS(data, file=file.path(outdir, "ICES_statistical_areas.Rds"))


# Plot data
################################################################################

# Theme
my_theme <-  theme(axis.text=element_text(size=8),
                   axis.title=element_blank(),
                   plot.title=element_text(size=10),
                   # Gridlines
                   panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(),
                   panel.background = element_blank(),
                   axis.line = element_line(colour = "black"),
                   # Legend
                   legend.background = element_rect(fill=alpha('blue', 0)))

# World
world <- rnaturalearth::ne_countries(scale="small", returnclass = "sf")

# Plot data
g <- ggplot() +
  # Plot world
  geom_sf(data=world, fill="grey80", color="white", lwd=0.2) +
  # Plot zones
  geom_sf(data=data, fill=NA, color="grey30", lwd=0.1) +
  # Labels
  labs(title="ICES statistical areas") +
  # Crop world
  coord_sf(x=c(-44, 69), y=c(36, 89)) +
  # Theme
  theme_bw() + my_theme
g

# Export plot
# ggsave(g, filename=file.path(plotdir, "ICES_statistical_areas.png"),
#        width=5.5, height=5.5, units="in", dpi=300)





