airquality
str(airquality)
dim(airquality)
variable.names(airquality)
summary(airquality)
x = aggregate(airquality,by = list(airquality$Month),FUN = mean)
x
na.omit(x)
is.na(x)
# converting it into matrix
Matrix1 = as.matrix(airquality)
Matrix1
is.na(Matrix1)
colSums(is.na(Matrix1))
Matrix1[is.na(Matrix1[,1])]
Matrix1[is.na(Matrix1[,1]),1] = round(mean(Matrix1[,1],na.rm = T))
Matrix1[is.na(Matrix1[,2]),2] = round(mean(Matrix1[,2],na.rm = T))
apply(Matrix1,2,FUN = mean)

