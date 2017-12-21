df=read.csv("./data/hackathon.csv")
str(df)
sum(is.na(df))
fit=lm(final~.,data=df)
summary(fit)
null=lm(final~1, data=df)
full=lm(final~., data=df)
step(null, scope=list(lower=null, upper=full), direction="forward")
fit2=lm(formula = final ~ unit2 + famrel + absences + unit1 + age + 
          activities + Walc + romantic, data = df)
summary(fit2)

library(dplyr)
library(caTools)

set.seed(123)

split = sample.split(df$final, SplitRatio = 0.80)

training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)
str(training_set)
str(test_set)
fullmodel=lm(formula = final ~  famrel +unit2  + unit1 + age + activities + 
               Walc + romantic, data = training_set)
summary(fullmodel)
library(ROCR)
finalpred = predict(fullmodel, type = 'response', 
                 newdata = test_set)
finalpred = round(finalpred)
finalpred[0:5]
finalpred[finalpred<=0]=0
error=test_set$final-finalpred
rmse=sqrt(mean(error*error))
rmse
plot(fullmodel,which=1)

