# sort order Rank
set.seed(1123)
marks = ceiling(runif(11,5,10))


# sort
sort(marks)

sort(marks,decreasing = TRUE)
sort(-marks)   # wrong
rev(sort(marks))

# NA values and sort later ----

# order
order(marks)  # incdices
marks
marks[order(marks)]  # similar to sort(x)
order(marks,decreasing = TRUE)
order(-marks)
marks[c(6,7,10)]
length(marks)
marks2 = marks
marks2[5] = NA # check with NA value : display, position
marks2
order(marks2)  # NA is last
?order
order(marks2,na.last = NA)  # removed
length(marks2)  # length is same
is.na(marks2)   # logical vector if NA
anyNA(marks2)   # is there is any Na

mean(marks2)  # does not work with Na value
mean(marks2,na.rm = TRUE)  # add na.rm=TRUE
order(marks2,na.last = NA)  # 5 is last
order(marks2,na.last = FALSE) # 5 is first
order(marks2,na.last = TRUE)
