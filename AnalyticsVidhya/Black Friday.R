trainset = read.csv('./data/blackfridaytrain.csv',header = T, stringsAsFactors = F, na.strings = c(""))
testset = read.csv('./data/blackfridaytest.csv', header = T, stringsAsFactors = F, na.strings = c(""))
str(trainset)
summary(trainset)
str(testset)
summary(testset)
library(rpart)
set.seed(23)
as.data.frame(colSums(is.na(trainset)))
as.data.frame(colSums(is.na(testset)))
trainset$data = 1
testset$Purchase = 0
testset$data = 0
total = rbind(trainset,testset)
for (i in 1:11)
{
  total[,i] <- as.factor(total[,i])
}

train.notmar = total[total$Marital_Status == 0,]
train.notmar = train.notmar[train.notmar$data == 1,]
test.notmar = total[total$data == 0,]

test.notmar$Purchase = NULL
test.notmar$data = NULL
train.notmar$data = NULL

# train.notmar[is.na(train.notmar)] <- -1 
#nam <- names(train)

#Decision Tree

model = rpart(Purchase ~ .,data = train.notmar)
pred_tree = predict(model, test.notmar)
submit = data.frame(User_ID = testset$User_ID,Product_ID = testset$Product_ID,Purchase = pred_tree)

# XGboost

library(xgboost)

for (i in 1:12)
{
  train.notmar[,i] <-  as.numeric(train.notmar[,i])
}

for (i in 1:11)
{
  test.notmar[,i] <-  as.numeric(test.notmar[,i])
}

#Features 
X_features = c( "User_ID","Product_ID","Gender","Age","Occupation","City_Category","Stay_In_Current_City_Years","Product_Category_1","Product_Category_2","Product_Category_3")
X_target = train.notmar$Purchase

xgtrain = xgb.DMatrix(data = as.matrix(train.notmar[, X_features]), label = X_target, missing = NA)
xgtest = xgb.DMatrix(data = as.matrix(test.notmar[, X_features]), missing = NA)

#Setting Parameters
params = list()
params$objective = "reg:linear"
params$eta = 0.23
params$max_depth = 10
params$subsample = 1
params$colsample_bytree = 1
params$min_child_weight = 2
params$eval_metric = "rmse"

#Model building 
model_xgb = xgb.train(params = params, xgtrain, nrounds = 100)

#checking important Features
vimp = xgb.importance(model = model_xgb, feature_names = X_features)

#Predicting 
pred_boost = predict(model_xgb, xgtest)

#Submission
submit$Purchase_boosted = pred_boost 
Final_submit = submit

#Weighted Average of Decision tree and Boosting
Final_submit$Purchase = (submit$Purchase + 2 * submit$Purchase_boosted)/3
write.csv(Final_submit[,-c(3,4)], "BF_Submission.csv", row.names = FALSE)
