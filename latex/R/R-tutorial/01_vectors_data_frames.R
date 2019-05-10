###
### How to run scripts: ----
###
### ctrl + shift + enter  -> run entire script
### ctrl + enter          -> run one line
### ctrl + alt + T        -> run section
###
###
### How to edit multiple lines:
###
### ctrl + alt                -> multiline selection
### ctrl + shift + up/down    -> copy line
###

print("Hello world")


# Declaring single-element vectors ----

v1 <- 5  # This is a vector with one element
print(class(v1))

v2 <- "abc"
print(class(v2))


# Manual declaration of multi-element vectors ----

v1 <- c(5, 2, 3, 6)
print(v1)
print(class(v1))  # It still says "numeric"


# Automatic declaration of vectors ----

v2 <- 1:10
print(v2)

v3 <- seq(1, 10, by = 3)
print(v3)


# Merging vectors ----

v4 <- c(v1, v2, v3)
print(v4)


# Indexing and slicing vectors ----

print(v4)               # Entire vector
print(v4[2])            # 2nd element
print(v4[1:3])          # 1st, 2nd, 3rd
print(v4[c(1, 3, 5)])   # 1st, 3rd, 5th


# Common functions on vectors ----

print(length(v4))      # length
print(mean(v4))        # mean
print(median(v4))      # median
print(sd(v4))          # standard deviation
print(var(v4))         # variance
print(cov(v4, v4))     # covariance


# Declaring data frames ----

df <- data.frame(
  X1 = 1:5,
  X2 = c(3, 5, 2, 1, 2),
  X3 = seq(0, 20, by = 5)
  )

print(df)     # Print entire data frame
print(head(df))   # Print beginning
print(tail(df))   # Print end

# Get column names ----

print(names(df))

# Indexing and slicing data frames ----
# There are different ways to do the same job!

print(df$x2)              # Print one column
print(df[['X2']])         # Also print one column (equivalent to df$x2)

print(df['X2'])           # Slice one column
print(df[c('X1', 'X3')])  # Slice two columns

print(df$x1[1])           # 1st element of column 'x1'
print(df$x1[c(1, 2, 5)])  # 1st, 2nd, 5th elements of column 'x1'

print(df[['X1']][1])            # 1st element of column 'x1'
print(df[['X1']][c(1, 2, 5)])   # 1st, 2nd, 5th elements of column 'x1'

# Note order: [rows, columns]
print(df[1, 1])           # 1st element of column 'x1' 
print(df[c(1, 2, 5), 1])  # 1st, 2nd, 5th elements of column 'x1'


# Reading data from CSV ----
df <- read.csv("R-tutorial/data_example.csv")

print(df)


# Ploting data frame ----

plot(df)


# Plot one variable agains another ----

plot(df$X1, df$Y)


# EXERCISE: calculate cov(X1, Y) and plot Y vs. X1 ----
# ....


