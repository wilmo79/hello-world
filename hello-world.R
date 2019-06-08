# a little R for hello-world

library(dplyr)
library(ggplot2)
library(readr)

df <- read_csv("https://markets.cboe.com/us/futures/market_statistics/historical_data/products/csv/VX/2020-01-22")

glimpse(df)

