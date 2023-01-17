library(tidyverse)
library(sf)

# Setup
################################################################################

# Directories

basedir <- "G:/My Drive/projects/mgmt_area_database"
setwd(basedir)

# Read data
rmfo1 <- readRDS(file.path(basedir, "processed", "rmfo", "northeast_atlantic_fisheries_commission", "northeast_atlantic_fisheries_commission.Rds"))

# Format data
################################################################################

data <- list(rmfo1) %>%
  reduce(full_join)

# Export data
################################################################################

saveRDS(data, file = file.path(basedir, "merged", "area_database.Rds"))
