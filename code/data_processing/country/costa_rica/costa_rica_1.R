library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
data_orig1 <- readRDS(file.path(basedir, "raw", "country", "costa_rica", "Costa_Rica_atlantic.RDS"))
data_orig2 <- readRDS(file.path(basedir, "raw", "country", "costa_rica", "Costa_Rica_pacific.RDS"))

data_orig = rbind(data_orig1, data_orig2)
# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Format data
################################################################################


data <- data_orig %>%
  # Reproject
  sf::st_transform(wgs84) %>%
  # rename to geom
  rename(geom = geometry,
         Owner_name_english = agency,
         System_name_english = dataset,
         Area_code = zone_id,
         Area_systematic_name_localized = zone_name,
         System_source = citation) %>%
  select(-country, -ocean, -region, -species, -created, -source, -type) %>% # required
  # add columns
  mutate(
    Owner_name_localized = "Instituto Costarricense de Pesca y Acuicultura", # preferred if no official translation unless not roman alphabet
    Owner_code_localized= "INCOPESCA",
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "cri",
    System_code = "AMPR", # required
    System_code_official = "1", # required
    System_multispecies = "1",
    System_shape_file = "costa_rica_1.KML and costa_rica_2.KML",
    System_georef_code = "zone_id",
    System_license_terms = "Public Domain", # required
    System_lineage = "Digitized by Leonardo Feitosa in Google Earth Engine", # required
    System_type = "Management Area", # required
    System_category = "Management Area", # required
    Area_systematic_name_english = "",
    Area_code_official = "0", # required
    Created_by = "Alicia Caughman / acaughman@ucsb.edu; Leonardo Feitosa",
    Created_on = Sys.Date()
  )

data$Area_code = c(1:nrow(data))
data$System_source_data = c("2019-11-29", "2019-11-29",
                            "2019-11-29", "2019-11-29",
                            "2019-11-29", "2019-11-29",
                            "2012-04-13", "2014-05-30",
                            "2012-03-29", "2012-03-29",
                            "2013-12-06", "2014-04-09",
                            "2018-04-27", "2010-06-23",
                            "2011-10-01", "2011-05-27")

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "costa_rica", "costa_rica_1.Rds"))
