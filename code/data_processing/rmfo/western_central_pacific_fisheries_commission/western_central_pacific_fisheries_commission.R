library(tidyverse)
library(sf)
library(rasterpic)

# Setup
################################################################################

# https://www.fao.org/wecafc/about/fr/
# https://www.fao.org/figis/geoserver/factsheets/rfbs_e.html?rfb=WECAFC&extent=-136.19140625,-28.33984375,6.19140625,68.33984375&center=-65,20&zoom=1&prj=4326

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
data_orig <- file.path(basedir, "raw", "rmfo", "western_central_pacific_fisheries_commission", "map.png")
b_box = st_bbox(c(xmin = -180, xmax = 180, ymax = 180, ymin = -180), crs = st_crs(4326))

# Transform
data_trans = rasterpic_img(b_box, data_orig)

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
    Owner_name_english = "", # required
    Owner_name_localized = "",
    Owner_code = "", # required
    Owner_code_localized = "",
    Owner_code_official = "", # required
    Owner_multinational = "", # required
    Owner_country = "",
    System_name_english = "", # required
    System_name_localized = "",
    System_additional_descriptor = "",
    System_code = "", # required
    System_code_localized = "",
    System_code_official = "", # required
    System_code_disambiguation = "",
    System_multispecies = "",
    System_species_description = "",
    System_source = "", # required
    System_source_date = "", # required
    System_shape_file = "",
    System_georef_code = "",
    System_license_terms = "", # required
    System_lineage = "", # required
    System_comment = "",
    System_type = "", # required
    System_type_code = "",
    System_category = "", # required
    Area_systematic_name_english = "", # required
    Area_systematic_name_localized = "",
    Area_descriptive_name = "",
    Area_code = "", # required
    Area_code_official = "", # required
    Area_parent_area = "",
    Area_comment = "",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "rmfo", "western_central_pacific_fisheries_commission", "XXX.Rds"))
