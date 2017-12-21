# Creating Data Frame
saledate = rep(c("2016-01-01","2016-02-01","2016-03-01","2016-04-01","2016-05-01","2016-06-01"))
saledate
dept = c(rep("Dept1",6),rep("Dept2",6),rep("Dept1",6),rep("Dept2",6))
city = c(rep("Delhi",12),rep("Noida",12))
city
saleamt = ceiling(runif(24,100,200))
set.seed(1234)
saleamt
advamt = ceiling(runif(24,25,40))
set.seed(1234)
advamt
df = data.frame(saledate,dept,city,saleamt,advamt)
df
# Data Manipulation
str(df)
df$dept = as.factor(df$dept)
levels(df$dept) = c("Dept1","Dept2")
df$city = as.factor(df$city)
str(df)
x1 = xtabs(saleamt~dept+city,df)
x1
x2 = xtabs(saleamt~city,df)
x2
addmargins(x1,c(2,1,1),FUN = list(sum,sd,mean))
prop.table(x1)
head(df)
df2 = df[df$city == "Noida",c("dept","saleamt","advamt")]
df2
df2[order(df2$saleamt,-df2$advamt),]
with(df2,boxplot(saleamt,dept))
within(df2,profit <- saleamt-advamt)
sweep(as.matrix(df2[,c(2,3)]),2,1,FUN = "+")
library(reshape2)
melt(df2,variable.name = "amttype",value.name = "amt")
plot(df2$saleamt,df2$advamt)
cor(df2$saleamt,df2$advamt) # 0.9982128 - Positive correlation
boxplot(df2$saleamt,df2$dept)
boxplot(df2$saleamt,df2$dept,df2$city)
aggregate(df2,list(df2$dept))
pie(df2,labels = prop.table(df2,df2$dept,df2$city))








































