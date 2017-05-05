
# Quantitative Financial Modelling and Trading Framework for R
library(quantmod)

# dplyr provides a flexible grammar of data manipulation. 
# It's the next iteration of plyr, focused on tools for working with data frames (hence the d in the name).
library(dplyr)

# Moving window statistics, GIF, Base64, ROC AUC, etc.
# Split samples
library(caTools)

# stringr: Simple, Consistent Wrappers for Common String Operations
library(stringr)

# xts: Constructor function for creating an extensible time-series object
# High Order Functions: min/max/sort/unique/duplicated/

library(zoo)
# zoo is the creator for an S3 class of indexed totally ordered observations 
# which includes irregular time series.
# -------------------------------------- Samples --------------------------------------------

# methods(class = 'data.frame')
# methods(plot)
# ds$Value[[3]]:    Extract the value 
# xts::last(DJI, '2 weeks')
# ds = mutate(ds, wins.1 = as.numeric( Result == 1 ))
# y ~ x: Imply the same simple linear regression model of y on x
# attr(ds,"index")

# -------------------------------------- End -------- --------------------------------------

# -------------------------------------- Command Notes --------------------------------------
# mutate:           Mutate adds new variables and preserves existing; transmute drops existing variables
# factor:           Used to encode a vector as a factor
# as:               Coerce an object to a given class
# weekdays:         Extract the weekday, month or quarter, or the Julian time 
# read.csv:         Reads a file in table format and creates a data frame from it
# ifelse
# xts - first/last: Return the first or last elements or rows of a vector or two-dimensional data object
#                   
# head/tail
# c:                Combines its arguments to form a vector
# is.na:            Missing Values
# subset:           Return subsets of vectors, matrices or data frames which meet conditions
# Types of objects: Vector, Data Frame, List, Matrix, Arrays, Function
# length, nrow
# lm:               Fitting Linear Models
# summary:          Produce result summaries of the results of various model fitting functions

# -------------------------------------- End -------- --------------------------------------


# -------------- A set of statistical tables -----------------
# Distribution	R name	additional arguments

# beta	beta	shape1, shape2, ncp
# binomial	binom	size, prob
# Cauchy	cauchy	location, scale
# chi-squared	chisq	df, ncp
# exponential	exp	rate
# F	f	df1, df2, ncp
# gamma	gamma	shape, scale
# geometric	geom	prob
# hypergeometric	hyper	m, n, k
# log-normal	lnorm	meanlog, sdlog
# logistic	logis	location, scale
# negative binomial	nbinom	size, prob
# normal	norm	mean, sd
# Poisson	pois	lambda
# signed rank	signrank	n
# Student’s t	t	df, ncp
# uniform	unif	min, max
# Weibull	weibull	shape, scale
# Wilcoxon	wilcox	m, n
# -------------------------------------- End -------- --------------------------------------

# --------------------------------------
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
lapply(x, mean)


x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
y = apply(x, 2, mean, trim = .2)

# --------------------------------------
numbers = c(23,4.1,5,6,9,10.01,33,100)
numbers[-1]
sort(numbers, decreasing = TRUE)
factored = factor(numbers)
levels(factored)

str(numbers)

readFiles = function(file){
  return (file*2)
}
as.character(numbers)
lapply(numbers,FUN = function(x) { x = x+1 } )
length(unique(numbers))

transform = numbers * 2 -1
seqNumbers = seq(1,10) * 3 + 100
# --------------------------------------

# Index vector
# Subset
filtered = numbers[numbers > 5]
mode(numbers[1:2]) # Vector vs. List
as.integer(numbers)
unclass(filtered)

x <- array(1:20, dim=c(4,5))   # 
list <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4,7,9))
list[1] # First Object
list[[1]] # Sublist
list = c(list, list) # Concatenating

# Distribution
summary(numbers)
fivenum(numbers)
stem(numbers)
hist(numbers)
lines(density(numbers, bw=0.1))
rug(numbers)
