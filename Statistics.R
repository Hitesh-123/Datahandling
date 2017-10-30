# Quantile

set.seed(1234)
x = ceiling(rnorm(100,50,10))
x
# Quartile
quantile(x,c(0.25,0.5,0.75))
sort(x)
quantile(x)
IQR(x)
Q1 = quantile(x,0.25)
(Q2 = quantile(x,0.5))
Q3 = quantile(x,0.75)
quantile(x,seq(.01,1,by = 0.01))
summary(x)
fivenum(x)
plot(density(x))
hist(x)
mtcars
colQuantiles(mtcars)
colSkewness(mtcars)
colStats(mtcars,FUN = mean)
library(timeSeries)
library(fBasics)
kurtosis(mtcars)
str(mtcars)
vars = c('mpg','hp','wt') # vector of variable names
vars
head(mtcars[vars]) # use these variable names as parameters to filter DF
# Descriptive Statistics-----
summary(mtcars)
summary(mtcars[vars])
# use apply or sapply to provide Descriptive Stats
sapply(mtcars[vars],mean)
sapply(mtcars,fivenum)
sapply(mtcars,median)
sapply(mtcars,sd)
sapply(mtcars,min)
sapply(mtcars,max)
sapply(mtcars,length)
sapply(mtcars,range)
sapply(mtcars,quantile)
library(Hmisc)
describe(mtcars[vars])
libra
stat.desc(mtcars[vars])
library(Rcmdr)
library(rattle)
install.packages("https://togaware.com/access/rattle_5.0.14.tar.gz", repos=NULL, type="source")
library(rattle.data)
rattle.data
data(attitude)