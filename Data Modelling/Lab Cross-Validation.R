require(ISLR)
require(boot)

?cv.glm
plot(mpg~horsepower,data=Auto)

##LOOCV
glm.fit = glm(mpg~horsepower,data=Auto)
cv.glm(data = Auto,glmfit = glm.fit)

cv.error = rep(0,5)
degree = 1:5

for (d in degree){
  glm.fit = glm(mpg~poly(horsepower,d),data=Auto)
  CV = cv.glm(data = Auto,glmfit = glm.fit)
  cv.error[d] = CV$delta[1]
}
plot(degree,cv.error,type = "b")


## 10-fold CV
cv.error10 = rep(0,5)
for (d in degree){
  glm.fit = glm(mpg~poly(horsepower,d),data=Auto)
  CV = cv.glm(data = Auto,glmfit = glm.fit,K = 10)
  cv.error10[d] = CV$delta[1]
}
lines(degree,cv.error10,type = "b",col = "red")