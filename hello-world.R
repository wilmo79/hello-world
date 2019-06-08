# a little R for hello-world

library(dplyr)
library(ggplot2)
library(readr)
library(tidyquant)  

df <- read_csv("https://markets.cboe.com/us/futures/market_statistics/historical_data/products/csv/VX/2020-01-22")

glimpse(df)
df <- rename(df, date=`Trade Date`)

# ht to https://cran.r-project.org/web/packages/tidyquant/vignettes/TQ04-charting-with-tidyquant.html
df %>%
  filter(Close != 0) %>%
  ggplot(aes(x = date, y = Close)) +
    geom_line() +
    labs(title = "CBOE Line Chart", y = "Closing Price", x = "") + 
    theme_tq()

df %>%
  filter(Close != 0) %>%
  ggplot(aes(x = date, y = Close)) +
    geom_candlestick(aes(open = Open, high = High, low = Low, close = Close),
                     color_up = "darkblue", color_down = "red") +
    labs(title = "CBOE Candlestick Chart", y = "Closing Price", x = "") +
    theme_tq()




