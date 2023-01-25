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
rmfo6 <- readRDS(file.path(basedir, "processed", "rmfo", "fishery_committee_eastern_central_atlantic", "fishery_committee_eastern_central_atlantic.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo7 <- readRDS(file.path(basedir, "processed", "rmfo", "joint_norwegian_russian_fishery_commission", "joint_norwegian_russian_fishery_commission.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo8 <- readRDS(file.path(basedir, "processed", "rmfo", "joint_technical_commission_maritime_front", "joint_technical_commission_maritime_front.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo9 <- readRDS(file.path(basedir, "processed", "rmfo", "lake_victoria_fisheries_organization", "lake_victoria_fisheries_organization.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo10 <- readRDS(file.path(basedir, "processed", "rmfo", "northwest_atlantic_fisheries_organization", "northwest_atlantic_fisheries_organization.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo11 <- readRDS(file.path(basedir, "processed", "rmfo", "pacific_salmon_commission", "pacific_salmon_commission.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo12 <- readRDS(file.path(basedir, "processed", "rmfo", "southeast_atlantic_fisheries_organization", "southeast_atlantic_fisheries_organization.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo13 <- readRDS(file.path(basedir, "processed", "rmfo", "southern_indian_ocean_fisheries_agreement", "southern_indian_ocean_fisheries_agreement.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo14 <- readRDS(file.path(basedir, "processed", "rmfo", "southpacific_regional_fisheries_management_organization", "southpacific_regional_fisheries_management_organization.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))
rmfo15 <- readRDS(file.path(basedir, "processed", "rmfo", "western_central_atlantic_fishery_commission", "western_central_atlantic_fishery_commission.Rds")) %>%
  mutate(georef_code = as.character(georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official))

# Format data
################################################################################

data_sf <- bind_rows(rmfo1, rmfo2, rmfo3, rmfo4, rmfo5, rmfo6, rmfo7, rmfo8, rmfo9, rmfo10, rmfo11, rmfo12, rmfo13, rmfo14, rmfo15)

data = data_sf %>%
  as.data.frame() %>%
  select(-geom)

# Export data
################################################################################

saveRDS(data_sf, file = file.path(basedir, "merged", "area_database.Rds"))
write_csv(data, file = file.path(basedir, "merged", "area_database.csv"))
