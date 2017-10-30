x = c(1.7,1.6,2.8,5.6,1.3,2.2,1.3,1.1,3.2,1.5,5.2,4.6,5.8,3)
y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1)
df  = data.frame(x,y)
fit=lm(formula = y ~ x)
fit
fit2 = lm(y~x,data=df)
fit2
length(x)
sum(x)
mean(x)
sum(y)
cov(x,y)
cor(x,y)
cor.test(x,y)
plot(x,y,main = 'Plot between x and y')
abline(lm(y~x),col = 'red')
df$X = x-mean(x)
df
df$Y = y-mean(y)
df
df$XY = df$X*df$Y
df
df$X2 = df$X^2
df
round(df)
ssxy = sum(df$XY)
ssxy
ssx = sum(df$X2)
ssx
b1 = ssxy/ssx
b1
df$SSr = round((df$YH - mean(y))^2,2)
df$SSe = round((df$y - df$YH)^2,2)
df
colSums(df)
R2 = sum(df$SSr)/(sum(df$SSe)+sum(df$SSr))
R2
mx = mean(df$x)
mx
my = mean(df$y)
my
b0 = my-b1-mx
b0
b0 = my-b1*mx
b0

df$YH = round(fitted(fit),2)
df
plot(df$YH,x)
df$residuals = round(df$y - df$YH,2)
df
summary(df$residuals)

SSe1 = sum(df$SSe)
SSe1
SE = sqrt(SSe1/12)
SE