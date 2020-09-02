library(tidyverse)
library(sf)
library(units)

library(USAboundaries)





conus_c = USAboundaries::us_states() %>%
  filter(!(name %in% c( 'Puerto Rico', 'Alaska', 'Hawaii'))) %>%
  st_combine %>%
  st_cast("MULTILINESTRING")

conus_c = st_transform(conus_c, "+proj=eqdc +lat_0=40 +lon_0=-96 +lat_1=20 +lat_2=60 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs")
plot(conus_c)
