library(dplyr)
library(tsibble)
library(forecast)
library(fable)

aus_tourism <- tourism |>
  summarise(Trips = sum(Trips))
aus_tourism |>
  model(ETS(Trips)) |>
  accuracy()
aus_tourism |>
  model(ETS(log(Trips))) |>
  forecast()


aus_tourism_ts <- as.ts(aus_tourism)
aus_tourism_ts |>
  ets() |>
  accuracy()
aus_tourism_ts |>
  ets(lambda = 0) |>
  forecast()
