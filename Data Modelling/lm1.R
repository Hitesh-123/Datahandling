#Linear Regression

#myfit = lm(formula,data)
data(women) # load women data set
women  #weight depends on height
# height (in)
# weight (lbs)
attach(women)
cov(height,weight)  # that means height increase as a result weight increase
cor(height,weight)  # means how strongly height is related to weight
(weight.lm = lm(weight ~ height, data = women))

summary(weight.lm)
plot(height,weight)
abline(weight.lm,col = 'red')
abline(h=150)
fitted((weight.lm))
