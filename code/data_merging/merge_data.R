library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
rmfo1 <- readRDS(file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo2 <- readRDS(file.path(basedir, "processed", "rmfo", "caribbean_regional_fisheries_mechanism", "caribbean_regional_fisheries_mechanism.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo3 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo4 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_southern_bluefin_tuna", "commission_conservation_southern_bluefin_tuna.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo5 <- readRDS(file.path(basedir, "processed", "rmfo", "convention_conservation_management_pollock_resources_central_bering_sea", "convention_conservation_management_pollock_resources_central_bering_sea.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))


# Format data
################################################################################

data_sf <- bind_rows(rmfo1, rmfo2, rmfo3, rmfo4, rmfo5)

data = data_sf %>%
  as.data.frame() %>%
  select(-geom)

# Export data
################################################################################

saveRDS(data_sf, file = file.path(basedir, "merged", "area_database.Rds"))
write_csv(data, file = file.path(basedir, "merged", "area_database.csv"))
