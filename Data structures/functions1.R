# Create function
x = 2 ; y = 3
(sumofnos = x + y)

(x1 = c(1:10))
(sumofnos = sum(x1))
fsum1 = function(x1) {
  sumofnos = sum(x1)/length(x1)
}
# code - Extract Function
# run above function lines
fsum1(x1) # no output
x1

fsum1(1:10)
(sumout = fsum1(x1)) # output seen : value assigned to a variable

# print output from function call
fsum2 = function(x1) {
  sumofnos = sum(x1)
  return(sumofnos)
}

fsum2(x1) # output seen
fsum2a <- function(x1) {
  sumofnos = sum(x1)
}
x1 = 1:10 ; y1 = 100:200

sum2a = function(x3, y3) {
  sumofnos = sum(x3) * mean(y3)
  return(sumofnos)
}
sum2a(x1,y1)
fsum3 = function(x1){
  sumofnos = sum(x1)
  print(sumofnos)
  print(paste('Sum of object is',sumofnos,sep = 'xxxx'))
  cat(paste('Sum of my object is',sumofnos,sep = ' '))
}
fsum3(x1)

# Check structure of function
body(fsum3)
body(fsum1)
args(fsum3)

args('bxp') # args of built in function
body(bxp)
pi
circle <- function(pi, r) {
  Area = pi*r^2
  return(Area)
}
circle(3.14,2)

Areaofcircle = (pi,r)




library(plyr)
plyr
# Structure of functions
lsf.str()
search()
ls()
lsf.str(pos=4)
lsf.str(pos=7)

save(circle,file = './data/hf1.RData')
rm(list=ls())
load(file = './data/hf1.RData')
circle
# R commands and objects name into character strings
args(circle)
(ch1 = deparse(args(circle)))
str(ch1)
circle2 =function(constant = 3.14,r) {
  circle = constant * r^2
  invisible(circle)
}
circle2(r=5)
(ch = circle2(r=5))

?print
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann')
sname
print(sname)
