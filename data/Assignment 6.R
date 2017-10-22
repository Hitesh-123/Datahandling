# Assignment 6

v = ceiling(seq(10,200,length.out = 40)) # equal interval between 10 and 200
v
m = matrix(v,nrow = 5) # create  the matrix 5*8 : columnswise---
m
# Return the product of each of the rows
apply(m,1,FUN = prod)
p = m[1,]*m[2,]*m[3,]*m[4,]*m[5,]
p
# Return the sum of each of the columns
addmargins(m,1,sum)
apply(m,2,FUN = sum)
# Return a new matrix whose entries are those of 'matrix values' modulo 10
apply(m,c(1,2),function(x) x%%10)
# How many odd nos each column has
y = apply(m,c(1,2),function(x) x%%2!=0)
y
apply(y,2,sum)

# view the data set iris

# get the mean of the first 4 variable, by species

iris
aggregate(iris[1:4],list(iris$Species),mean)

# Question 2----
# Environment
# create a new environment
e = new.env()
e
e$a = matrix(1:12,nrow = 4)
e$b = array(c(1:3*4*2),dim = c(3,4,2))
e$a
e$b
eapply(e,mean)
eapply(e,class)

# Question 3----
# Create a list with 2 elements 1:20 and 55:100 and mpg and weight col of mtcars dataset
v1 = c(1:20)
v2 = c(55:100)
l = list(v1,v2,mtcars$wt,mtcars$mpg)
l
# Find the sum of the values in each element
lapply(l,sum) # print the values in the form of list
sapply(l,sum) # print the values in the form of vector
# Question 4
# sweep
M = matrix(1:12,ncol = 3)
M
M + 2
M + c(1,2)
# calculate column-wise mean for M
dx = colMeans(M)
dx
colSums(M)
M + c(1,2,3)
cbind(M,M + c(1,2,3))
sweep(M,2,dx,FUN = "-")
M ; dx
sweep(M,1,dx,FUN = "-")
sweep(M,2,dx,FUN = "+")
sweep(M,1,dx,FUN = "+")
sweep(M,c(1,2),3,FUN = "-")
sweep(M,c(1,2),3,FUN = "+")
M
round(seq(10,200,length.out = 10))
ceiling(seq.int(1,100,length.out = 5))
M[,1] * M[,2]

# study data set: attitude
attitude
# Calculate median value of each column
dx1 = apply(attitude,2,FUN = median)
# Subtract median of each column to respective of value of that column
sweep(attitude,2,dx1,FUN = "-")
# Create an array
a = array(1:24,dim = c(4,3,2))
a
# Subtract 5 from each row
sweep(a,1,5,FUN = "-")
# Find minimum of each row dimension values
mini = apply(a,1,min)
mini
# subtract this minimum value from each row dimension values
sweep(a,1,mini,FUN="-")
# subtract median value across row & col dimensions
sweep(a,1:2,apply(a,1:2,median))
## warnings when mismatch # understand them
sweep(a, 1, 1:3)  # STATS does not recycle
sweep(a,1,6:1) # STATS is longer
## exact recycling
sweep(a, 1, 1:2)  # no warning

# Question 5
# cast and melt(reshape2)
library(reshape)
require(reshape)
# create data frame
(x = data.frame(subject = c("Lalit", "Vijay"),    time = c(1,1), age = c(33,NA),   weight = c(80, NA),  height = c(2,2)))
# melt data frame
melt(x)
# removing NA values
is.na(x) # TRUE for na values
complete.cases(x)
!complete.cases(x)
x[!complete.cases(x),] # gives row having NA values
colSums(is.na(x)) # gives columns with NA values
x$age[is.na(x$age)] = 26
x$weight[is.na(x$weight)] = 75
x
y = melt(x)
y
# Now reshape the molten data - pending
dcast(y,subject~variable)
# dataset - airquality
airquality
# melting
y1 = melt(airquality)
y1
#casting - pending

# Question 6 - Merge
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
course =  c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS', 'PGDDS','PGDDS','PGDDS')
df1 = data.frame(rollno,sname,course)
df1
gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8) # Experience
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
df2 = data.frame(rollno,gender,exp,hostel)
df2
#Merge the data frame : automatically
merge(df1,df2)
# Create DF of marks of subject1
ID = c(17010,17045,17012,1)
SEX = c('M','F','M','M')
SUB1 = c(50,60, 70,80)
(df3 = data.frame(ID, SEX, SUB1))
#use to columns to join df1 & df3
df1$gender = gender
df1
df3
merge(df1, df3, by.x = c('rollno','gender'), by.y=c('ID','SEX'))
merge(df1,df3,by.x=c('rollno'),by.y = c('ID'),all = T) # all rows from df1 & df3
merge(df1,df3,by.x='rollno',by.y = 'ID',all.x=T) # all rows from df1
merge(df1,df3,by.x=c('rollno'),by.y = c('ID'),all = F) # intersection of df1$rollno & df3$ID  
merge(df1,df3,by.x='rollno',by.y = 'ID',all.y=T) # all rows from df3
# Question 7 - stack
classA = c(10,14,15)
classB = c(20,25,27)
classC = c(13,15,17)
classmarks = data.frame(classA,classB,classC)
classmarks
stack(classmarks)
d = stack(classmarks,c('classA','classC'))
unstack(d)
# Question 8 - By
df4 = read.csv("./data/dsstudents.csv",na.strings = '')
df4
b1 = by(df4[,c(11)],INDICES = df4$course,mean)
b1
b2 = by(df4[,c(12)],INDICES = df4$course,mean)
b2
b3 = by(df4[,c(13)],INDICES = df4$course,mean)
b3
b4 = by(df4[,c(14)],INDICES = df4$course,mean)
b4
b5 = by(df4[,c(1)],INDICES = df4$course,mean)
b5
b6 = by(df4[,c(7)],INDICES = df4$course,mean)
b6
save(b1,b2,b3,b4,b5,b6,file = 'mydata.RData')
# Question 9 - Aggregate



library(datasets)
# study the dataset - mtcars
mtcars
# Get the mean mpg by Transmission
tapply(mtcars$mpg, mtcars$am, mean)
# Get the mean mpg for Transmission grouped by Cylinder(cyl)
aggregate(mpg~am + cyl,data = mtcars, mean)
df6 = read.csv("./data/dsstudents.csv",na.strings = '')
df6