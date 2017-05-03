# Data Preprocessing Template
library(Quandl)
# Const Numbers
const.gapDays = 7
const.gapPercentage = 2
const.consecutiveDays = 2

# Importing the dataset
#ds = read.csv('Data.csv')
#ds = read.csv('BCB-UDJIAD.csv')
#ds = read.csv('BCB-UDJIAD-3y.csv')
#ds = read.csv('Temp.csv')
ds = Quandl("BCB/UDJIAD1", api_key="8xp2LGSdspyyNuNJLzX6")
ds = ds[1:700, ]

# Add Date Column
dateToWeekday = function(date) {
  return (weekdays(as.Date(date, '%Y-%m-%d')))
}

dates = NULL
for(index in 1:nrow(ds) ) {
  dates = c(dates,dateToWeekday(ds[index, 'Date']))
}
ds$Weekday = as.factor(dates)
# End

# Add Win or Lose Column
evaluateResult = function(valueToday, valueFuture) {
  percentage = (valueFuture - valueToday)*100/valueToday
  if (percentage > const.gapPercentage ) {
    return (percentage)
  }
  else {
    return (percentage)
  }
}

results = NULL
for(index in 1:nrow(ds)) {
  today = ds[index, 'Value']
  indexFuture = index - const.gapDays
  
  if(indexFuture > 0) {
    future = ds[indexFuture, 'Value']
    results = c(results, evaluateResult(today, future))
  }
  else {
    results = c(results, 0)
  }
}

ds$Percentage = results
# End

# Win or Lose Column
ds$Result = as.factor(ifelse(results > const.gapPercentage, 1, 0))

# Consecutive Winning Days Column


#ds$testCol = data.frame(testCol = rep('NA', nrow(ds)), ds[,])

library(dplyr)

ds$diffs = ds[(nrow(ds) - 1), 'Result']

ds = mutate(ds, wins.2 = as.numeric( Result == 1 & lag(Result) == Result))
ds = mutate(ds, wins.3 = as.numeric( Result == 1 & lag(Result) == Result & lag(Result,2) == Result))

wins = subset(ds, wins.3 == 1)

library(quantmod)
library(PerformanceAnalytics)  # loads/attaches xts
# Convert DATE to Date class
ds$Date <- as.Date(ds$Date,format="%Y-%m-%d")
x = xts(ds$wins.3, ds$Date)
y = xts(ds$Value, ds$Date) 
chart_Series(x)
chart_Series(y)

#plot(ds[, "wins.3"], main = "Down")
# Plot
# How to plot factors in a specified order in ggplot
# x$name <- factor(x$name, levels = x$name[order(x$val)])


# library(ggplot2)
# ggplot(wins, aes(x = Date, fill = Result)) +
#   stat_count(width = 0.5) +
#   xlab("Weekday") +
#   ylab('Result') +
#   labs(fill = 'Win')
#End


