library(quantmod)
library(Quandl)
library(dplyr)
library(PerformanceAnalytics)  # loads/attaches xts
library(caTools)
library(h2o)

# Const Numbers

const.gapDays = 13
const.gapPercentage = 3.5

start = as.Date("2010-01-01")
end = as.Date("2017-05-01")

getSymbols("^DJI", src="yahoo", from = start)


ds = data.frame(DJI)
ds$Date = as.character(index(DJI))
ds$Date = as.Date(ds$Date,format="%Y-%m-%d")

# Value as Closed Point 
ds$Value = ds$DJI.Close

#------------------------------------------------------
# Add Percentage Column
ds = mutate(ds, Percentage = (lead(Value, n = const.gapDays) - Value)*100/Value )
# End

# Win or Lose Column
ds$Result = ifelse(ds$Percentage > const.gapPercentage, 1, 0)
# End

# Consecutive Winning Days Column
ds = mutate(ds, wins.1 = as.numeric( Result == 1 ))
ds = mutate(ds, wins.2 = as.numeric( Result == 1 & lag(Result) == Result))
ds = mutate(ds, wins.3 = as.numeric( Result == 1 & lag(Result) == Result & lag(Result,2) == Result))
# wins = subset(ds, wins.1 == 1)
# End


plot(ds$Date,ds$Value, type="l",col="red")
points(ds$Date, ds$wins.3 * ds$Value, col="black")


#------------------------------------------------------
