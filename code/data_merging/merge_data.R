library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database_ac"
setwd(basedir)

# Read data
rmfo1 <- readRDS(file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo2 <- readRDS(file.path(basedir, "processed", "rmfo", "caribbean_regional_fisheries_mechanism", "caribbean_regional_fisheries_mechanism.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo3 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo4 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_southern_bluefin_tuna", "commission_conservation_southern_bluefin_tuna_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo5 <- readRDS(file.path(basedir, "processed", "rmfo", "convention_conservation_management_pollock_resources_central_bering_sea", "convention_conservation_management_pollock_resources_central_bering_sea.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo6 <- readRDS(file.path(basedir, "processed", "rmfo", "fishery_committee_eastern_central_atlantic", "fishery_committee_eastern_central_atlantic.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo7 <- readRDS(file.path(basedir, "processed", "rmfo", "joint_norwegian_russian_fishery_commission", "joint_norwegian_russian_fishery_commission.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo8 <- readRDS(file.path(basedir, "processed", "rmfo", "joint_technical_commission_maritime_front", "joint_technical_commission_maritime_front.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo9 <- readRDS(file.path(basedir, "processed", "rmfo", "lake_victoria_fisheries_organization", "lake_victoria_fisheries_organization.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo10 <- readRDS(file.path(basedir, "processed", "rmfo", "northwest_atlantic_fisheries_organization", "northwest_atlantic_fisheries_organization_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo11 <- readRDS(file.path(basedir, "processed", "rmfo", "pacific_salmon_commission", "pacific_salmon_commission_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo12 <- readRDS(file.path(basedir, "processed", "rmfo", "southeast_atlantic_fisheries_organization", "southeast_atlantic_fisheries_organization.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo14 <- readRDS(file.path(basedir, "processed", "rmfo", "southpacific_regional_fisheries_management_organization", "southpacific_regional_fisheries_management_organization.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo15 <- readRDS(file.path(basedir, "processed", "rmfo", "western_central_atlantic_fishery_commission", "western_central_atlantic_fishery_commission.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo16 <- readRDS(file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo17 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo18 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_3.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo19 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_4.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo20 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_5.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo21 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_antartic_marine_living_resources", "commission_conservation_antartic_marine_living_resources_6.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo22 <- readRDS(file.path(basedir, "processed", "rmfo", "northwest_atlantic_fisheries_organization", "northwest_atlantic_fisheries_organization_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo23 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexican_lake_management_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo24 <- readRDS(file.path(basedir, "processed", "rmfo", "commission_aquatic_bio_resources_caspian_sea", "commission_aquatic_bio_resources_caspian_sea.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo25 <- readRDS(file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "great_lakes_fishery_commission.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo26 <- readRDS(file.path(basedir, "processed", "rmfo", "peipsi_center_for_transboundary_cooperation", "peipsi_center_for_transboundary_cooperation.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo27 <- readRDS(file.path(basedir, "processed", "rmfo", "pacific_salmon_commission", "pacific_salmon_commission_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo28<- readRDS(file.path(basedir, "processed", "rmfo", "commission_conservation_southern_bluefin_tuna", "commission_conservation_southern_bluefin_tuna_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo29 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexican_lake_management_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo30 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo31 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo32 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_3.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo33 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_4.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo34 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_5.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo35 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_6.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo36 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_7.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo37 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_8.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo38 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_9.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo39 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_10.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo40 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_11.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo41 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_12.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo42 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_13.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo43 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_14.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo44 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_15.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo45 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_16.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo46 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_17.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo47 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_18.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo48 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_19.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo49 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_20.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo50 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_21.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo51 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_22.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo52 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_23.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo53 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_24.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo54 <- readRDS(file.path(basedir, "processed", "rmfo", "canada_US_transboundary_management_guidance_committee", "canada_US_transboundary_management_guidance_committe.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo55 <- readRDS(file.path(basedir, "processed", "country", "EEZ", "EEZ_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo56 <- readRDS(file.path(basedir, "processed", "country", "greece", "greece_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo57 <- readRDS(file.path(basedir, "processed", "country", "ireland", "ireland_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo58 <- readRDS(file.path(basedir, "processed", "country", "panama", "panama_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo59 <- readRDS(file.path(basedir, "processed", "country", "uruguay", "uruguay_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo60 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo61 <- readRDS(file.path(basedir, "processed", "country", "panama", "panama_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo62 <- readRDS(file.path(basedir, "processed", "country", "us", "us_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo63 <- readRDS(file.path(basedir, "processed", "country", "us", "us_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo64 <- readRDS(file.path(basedir, "processed", "rmfo", "ices", "ices_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo65 <- readRDS(file.path(basedir, "processed", "country", "scotland", "scotland_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo66 <- readRDS(file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "glfc_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo67 <- readRDS(file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "glfc_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo68 <- readRDS(file.path(basedir, "processed", "rmfo", "great_lakes_fishery_commission", "glfc_3.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo69 <- readRDS(file.path(basedir, "processed", "country", "greenland", "greenland_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo70 <- readRDS(file.path(basedir, "processed", "country", "greenland", "greenland_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo71 <- readRDS(file.path(basedir, "processed", "country", "greenland", "greenland_3.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo90 <- readRDS(file.path(basedir, "processed", "country", "isle_of_man", "isle_of_man_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo92 <- readRDS(file.path(basedir, "processed", "country", "argentina", "argentina_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo93 <- readRDS(file.path(basedir, "processed", "rmfo", "joint_technical_commission_maritime_front", "argentina_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo94 <- readRDS(file.path(basedir, "processed", "country", "colombia", "colombia_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo95 <- readRDS(file.path(basedir, "processed", "country", "costa_rica", "costa_rica_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo96 <- readRDS(file.path(basedir, "processed", "country", "ecuador", "ecuador_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo97 <- readRDS(file.path(basedir, "processed", "country", "suriname", "suriname_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo98 <- readRDS(file.path(basedir, "processed", "country", "nicaragua", "nicaragua_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM") %>%
  mutate(System_species_description = as.character(System_species_description))
rmfo99 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_2.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo100 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_3.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo101 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_4.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo13 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_5.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo72 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_6.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo73 <- readRDS(file.path(basedir, "processed", "country", "canada", "canada_7.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  mutate(System_source_date = as.character(System_source_date))
  st_zm(drop = TRUE, what = "ZM")
rmfo74 <- readRDS(file.path(basedir, "processed", "country", "portugal", "portugal_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo75 <- readRDS(file.path(basedir, "processed", "country", "macedonia", "macedonia_1.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo76 <- readRDS(file.path(basedir, "processed", "country", "us", "us_3.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo77 <- readRDS(file.path(basedir, "processed", "rmfo", "inpfc", "inpfc.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(System_source_date = as.character(System_source_date)) %>%
  mutate(Area_code = as.character(Area_code))
rmfo78 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_25.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo79 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_26.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo80 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_27.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo81 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_28.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo82 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_29.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo83 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_30.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo84 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_31.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo85 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_32.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo86 <- readRDS(file.path(basedir, "processed", "country", "mexico", "mexico_33.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")
rmfo87 <- readRDS(file.path(basedir, "processed", "country", "us", "us_4.Rds")) %>%
  mutate(System_georef_code = as.character(System_georef_code)) %>%
  mutate(Owner_code_official = as.character(Owner_code_official)) %>%
  mutate(Owner_multinational = as.character(Owner_multinational)) %>%
  mutate(System_code_official = as.character(System_code_official)) %>%
  mutate(Area_code = as.character(Area_code)) %>%
  st_zm(drop = TRUE, what = "ZM")

# Format data
################################################################################

data_sf <- bind_rows(rmfo1,   rmfo2,  rmfo3,  rmfo4,  rmfo5,  rmfo6,  rmfo7,  rmfo8,  rmfo9,  rmfo10,
                     rmfo11,  rmfo12, rmfo13, rmfo14, rmfo15, rmfo16, rmfo17, rmfo18, rmfo19, rmfo20,
                     rmfo21,  rmfo22, rmfo23, rmfo24, rmfo25, rmfo26, rmfo27, rmfo28, rmfo29, rmfo30,
                     rmfo31,  rmfo32, rmfo33, rmfo34, rmfo35, rmfo36, rmfo37, rmfo38, rmfo39, rmfo40,
                     rmfo41,  rmfo42, rmfo43, rmfo44, rmfo45, rmfo46, rmfo47, rmfo48, rmfo49, rmfo50,
                     rmfo51,  rmfo52, rmfo53, rmfo54, rmfo55, rmfo56, rmfo57, rmfo58, rmfo59, rmfo60,
                     rmfo61,  rmfo62, rmfo63, rmfo64, rmfo65, rmfo66, rmfo67, rmfo68, rmfo69, rmfo70,
                     rmfo71,  rmfo72, rmfo73, rmfo74, rmfo75, rmfo76, rmfo77, rmfo78, rmfo79, rmfo80,
                     rmfo81,  rmfo82, rmfo83, rmfo84, rmfo85, rmfo86, rmfo87,
                     rmfo90,  rmfo92, rmfo93, rmfo94, rmfo95, rmfo96, rmfo97, rmfo98, rmfo99, rmfo100,
                     rmfo101)

rm(rmfo1,   rmfo2,  rmfo3,  rmfo4,  rmfo5,  rmfo6,  rmfo7,  rmfo8,  rmfo9,  rmfo10,
   rmfo11,  rmfo12, rmfo13, rmfo14, rmfo15, rmfo16, rmfo17, rmfo18, rmfo19, rmfo20,
   rmfo21,  rmfo22, rmfo23, rmfo24, rmfo25, rmfo26, rmfo27, rmfo28, rmfo29, rmfo30,
   rmfo31,  rmfo32, rmfo33, rmfo34, rmfo35, rmfo36, rmfo37, rmfo38, rmfo39, rmfo40,
   rmfo41,  rmfo42, rmfo43, rmfo44, rmfo45, rmfo46, rmfo47, rmfo48, rmfo49, rmfo50,
   rmfo51,  rmfo52, rmfo53, rmfo54, rmfo55, rmfo56, rmfo57, rmfo58, rmfo59, rmfo60,
   rmfo61,  rmfo62, rmfo63, rmfo64, rmfo65, rmfo66, rmfo67, rmfo68, rmfo69, rmfo70,
   rmfo71,  rmfo72, rmfo73, rmfo74, rmfo75, rmfo76, rmfo77, rmfo78, rmfo79, rmfo80,
   rmfo90,  rmfo92, rmfo93, rmfo94, rmfo95, rmfo96, rmfo97, rmfo98, rmfo99, rmfo100,
   rmfo101)

data = data_sf %>%
  st_drop_geometry()


# Export data
################################################################################

saveRDS(data_sf, file = file.path(basedir, "merged", "area_database.Rds"))
#st_write(data_sf, file.path(basedir, "merged", "area_database.shp"))
st_write(data_sf, file.path(basedir, "merged", "area_database.gpkg"), append=FALSE)
write.csv(data, file = file.path(basedir, "merged", "area_database.csv"), row.names = FALSE)
