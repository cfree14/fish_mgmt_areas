library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Coordinate system
wgs84 <- sf::st_crs("+proj=longlat +datum=WGS84")

# Read data
data_orig <- st_read(file.path(basedir, "raw", "country", "canada", "DFO-MPO_Regions2021.gdb")) %>%
  sf::st_transform(wgs84) %>%
  select(Shape, Region_FR, Region_EN)

# Format data
################################################################################

# Format data

data <- data_orig %>%
  # rename to geom
  rename(geom = Shape) %>%
  mutate(System_georef_code = "Area_code",
         Area_systematic_name_english = Region_EN,
         Area_systematic_name_localized = Region_FR)

data = data %>% # required
  # add columns
  mutate(
    Owner_name_english = "Canada Coast Guard and Fisheries and Oceans Canada", # required
    Owner_code = "CCG/DFO", # required
    Owner_code_official = "1", # required
    Owner_multinational = "0", # required
    Owner_country = "can",
    System_name_english = "Fisheries and Oceans Canada Regions", # required
    System_code = "FOCA", # required
    System_code_official = "0", # required
    System_multispecies = "1",
    System_species_description = "",
    System_source = "Canada Coast Guard and Fisheries and Oceans Canada. (01 Jan 2021). Fisheries and Oceans Canada Regions. open.canada.ca. Retrieved 25 May 2023: https://open.canada.ca/data/en/dataset/3862c9fa-dbeb-4f00-ac03-c5da6551bf00", # required
    System_source_date = "2021-01-01", # required
    System_shape_file = "DFO-MPO_Regions2021.gdb",
    System_license_terms = "Copyleft- Attribution only", # required
    System_lineage = "Downloaded and imported from open.canada.ca on 25 May 2023", # required
    System_type = "Canada Fisheries and Oceans Canada Regions", # required
    System_category = "Management Area", # required
    Area_code_official = "0", # required
    System_comment = "DFO and CCG operations and research cover Canada's land and waters to the international boundaries (EEZ) and are in no way limited to the boundaries drawn in the map.",
    Created_by = "Alicia Caughman / acaughman@ucsb.edu",
    Created_on = Sys.Date()
  )

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "processed", "country", "canada", "canada_1.Rds"))
