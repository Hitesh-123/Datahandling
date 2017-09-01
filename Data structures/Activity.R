x = scan()  # use to copy the data from excel to R
43
60
37
48
65
48
57
78
31
59
50
x
y = scan()
?scan
y = scan(what = 'character')
x = 1:12
x = c(1:12,1,5,5)
x
table(x)
names(table(x))
sort(table(x))
sort(table(x),dec = T)
names(table(x))[1]
names(sort(table(x),dec = T))[1]
set.seed(1234)
x = ceiling(rnorm(100,60,15)) # exercise for normal distribution
x
mean(x)
median(x)
table(x)
range(x)
breaks = seq(min(x),max(x),10) # use to make the class intervals
breaks = seq(20,100,10)
?cut
