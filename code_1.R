# Welcome to SpreadsheetToRstats!

# Lines that start with '#' are called 'comments' and are not interpreted as R code

# Operators ---------------------------------------------------------------

x <- -4
x + 1
x * 0
x:10

y <- x:10
y[1]

# Functions ---------------------------------------------------------------

sqrt(x)  # function(argument)
class(x)
z <- c(x, x, x)

?class # help!!!
?c

# * Excercises --------------------------------------------------------------

values <- c(9, 10, 6, 4, 7, 8)

# 1. Multiply every element in `values` by 2 and save it as a new variable `values_times_two`

values * 2

# 2. Calculate the mean of `values`, using the functions `sum()` and `length()`

sum(values) / length(values)

# 2. Calculate the mean of `values_plus_one`, using the function `mean()`

values_plus_one <- values + 1
mean(values_plus_onex)


# 3. Calculate the standard deviation of `values` and `values_times_two`, with function `sd()`

values_times_two <- values * 2

sd(values)
sd(values_times_two)


# Classes / Types ---------------------------------------------------------------

class(x)
typeof(x)

y <- "9"
class(y)
typeof(y)

z <- TRUE
class(z)
typeof(z)

# Vectors -----------------------------------------------------------------

vec <- c(1, 2, 3, 4)

class(vec)
length(vec)

vec[1]
vec[1:2]
vec[-1]
vec[-1:-3]

vec <- c(1, 2, 3, "4")
class(vec)

# Lists -------------------------------------------------------------------

li <- list("element1" = 1:3,
           "element2" = "two",
           "element3" = c(TRUE, FALSE))

class(li)

li[1]
class(li[1])

li[[1]]
class(li[[1]])

li[["element1"]]


# Data frames -------------------------------------------------------------

dat <- data.frame(
  "value" = 1:4,
  "key" = c("A", "A", "B", "B")
)

dat[1]
class(dat[1])

dat[[1]]
class(dat[[1]])

dat[,1]
class(dat[,1])

dat[1,]
class(dat[1,])

dat[1:2,]
dat[-1, ]

dat[c(TRUE, TRUE, FALSE, FALSE), ]

# * Exercises -------------------------------------------------------------

# 1. Finishing defining the list, `three_types` below. Make each element have the same type as its name.
#    Call `typeof()` on it to prove it.

three_types <- list(
  "double" =  ,
  "character" =  ,
  "logical" = 
)

# 2. Check the class of the third element in the list `li`. 


# 3. Define a new data frame with only the rows from `dat` where "key" equals "B"

