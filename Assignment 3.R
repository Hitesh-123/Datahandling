#Q1 Sales of Coy for Qtd
a = c('Q1','Q2','Q3','Q4')
a
b = c(10000,13000,12000,15000)
b
df1 = data.frame(a,b)
df1
barplot(df1$b,names.arg=df1$a,xlab='Quarter',ylab='Sales',main='Coy Sales',ylim=c(0,20000))
df1[df1$b>11000,]
df1[df1$a=='Q3',2]
v1 <- sample(c('A','P'), size=30, replace=T, prob = c(0.3,0.7))
v1
table(v1)
set.seed(1000)
P1 = ceiling(runif(10,30,100))
P1
