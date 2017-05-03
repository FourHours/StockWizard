
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
