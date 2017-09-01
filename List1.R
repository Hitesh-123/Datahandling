y = "My List"
y
x = c(1,2,3,4)
x
z = matrix(c(1,2,3,4),ncol=2)
z
z = matrix(c(1:4),ncol=2)
z
a = c("one","two","three","four")
a
df = data.frame(formno = c(56,57,58),name = c('Hitesh','Apoorva','Goldie'),gender = c('M','F','M'), stringFactors = F)
df
nobs(df)
n(df)
ncol(df)
nrow(df)
str(df)
mylist = list(y,x,z,a)
mylist = list(title=y,ages=x,z,a,df)
mylist #full list
mylist[2] # ages
mylist[2] # ages as a vector
mylist[['ages']] # ages as a vector
mylist$students%name # if students name not defined mylist[[5]$name
mylist[[5]$name
       