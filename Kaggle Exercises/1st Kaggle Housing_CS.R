train_set = read.csv(file = './data/housing_train.csv',stringsAsFactors = F)
test_set = read.csv(file = './data/housing_test.csv',stringsAsFactors = F)
str(train_set)
str(test_set)
as.data.frame(colSums(is.na(test_set)))
Sale_Price = train_set$SalePrice
train_set$SalePrice = NULL
str(train_set)
alldata = rbind(train_set,test_set)
str(alldata)
library(Amelia)
set.seed(1234)
missmap(alldata, main = "Missing values vs Observed")
as.data.frame(colSums(is.na(alldata)))
names(sort(-table(alldata$MSZoning)))
alldata$MSZoning[is.na(alldata$MSZoning)] = "RL"
alldata$Utilities[is.na(alldata$Utilities)] = "AllPub"
alldata$Exterior1st[is.na(alldata$Exterior1st)] = "Plywood"
alldata$Exterior2nd[is.na(alldata$Exterior2nd)] = "Tar&Grv"
names(sort(-table(alldata$SaleType)))
alldata$SaleType[is.na(alldata$SaleType)] = "WD"
alldata$GarageCars[is.na(alldata$GarageCars)] = "2"
alldata$GarageArea[is.na(alldata$GarageArea)] = "1150"
as.data.frame(colSums(is.na(alldata)))
alldata$BsmtFinSF1[is.na(alldata$BsmtFinSF1)] = "O"
alldata$BsmtFinSF2[is.na(alldata$BsmtFinSF2)] = "O"
alldata$BsmtUnfSF[is.na(alldata$BsmtUnfSF)] = "O"
alldata$Electrical[is.na(alldata$Electrical)] = "SBrkr"
alldata$TotalBsmtSF[is.na(alldata$TotalBsmtSF)] = "O"
alldata$BsmtFullBath[is.na(alldata$BsmtFullBath)] = "O"
alldata$BsmtHalfBath[is.na(alldata$BsmtHalfBath)] = "O"
alldata$KitchenQual[is.na(alldata$KitchenQual)] = "TA"
alldata$Functional[is.na(alldata$Functional)] = "Typ"
alldata$MasVnrType[is.na(alldata$MasVnrType)] = "None"
alldata$MasVnrArea[is.na(alldata$MasVnrArea)] = "0"
alldata$BsmtQual[is.na(alldata$BsmtQual)] = "TA"
alldata$BsmtCond[is.na(alldata$BsmtCond)] = "TA"
alldata$BsmtExposure[is.na(alldata$BsmtExposure)] = "No"
alldata$BsmtFinType1[is.na(alldata$BsmtFinType1)] = "Unf"
alldata$BsmtFinType2[is.na(alldata$BsmtFinType2)] = "Unf"
alldata$GarageType[is.na(alldata$GarageType)] = "Attchd"
alldata$GarageYrBlt[is.na(alldata$GarageYrBlt)] = round(median(alldata$GarageYrBlt, na.rm = T))
alldata$GarageFinish[is.na(alldata$GarageFinish)] = "Unf"
alldata$GarageQual[is.na(alldata$GarageQual)] = "TA"
alldata$GarageCond[is.na(alldata$GarageCond)] = "TA"
alldata$LotFrontage[is.na(alldata$LotFrontage)] = round(median(alldata$LotFrontage, na.rm = T))
alldata$FireplaceQu[is.na(alldata$FireplaceQu)] = "Gd"
alldata$PoolQC[is.na(alldata$PoolQC)] = "Ex"
alldata$Fence[is.na(alldata$Fence)] = "MnPrv"
alldata$MiscFeature[is.na(alldata$MiscFeature)] = "Shed"
alldata$Alley[is.na(alldata$Alley)] = "Grvl"
as.data.frame(colSums(is.na(alldata)))
alldata$MSZoning = as.factor(alldata$MSZoning)
alldata$Street = as.factor(alldata$Street)
alldata$Alley = as.factor(alldata$Alley)
alldata$LotShape = as.factor(alldata$LotShape)
alldata$LandContour = as.factor(alldata$LandContour)
alldata$Utilities = as.factor(alldata$Utilities)
alldata$LotConfig = as.factor(alldata$LotConfig)
str(alldata)
alldata$LandSlope = as.factor(alldata$LandSlope)
alldata$Neighborhood = as.factor(alldata$Neighborhood)
alldata$Condition1 = as.factor(alldata$Condition1)
alldata$Condition2 = as.factor(alldata$Condition2)
alldata$BldgType = as.factor(alldata$BldgType)
alldata$HouseStyle = as.factor(alldata$HouseStyle)
alldata$RoofStyle = as.factor(alldata$RoofStyle)
alldata$RoofMatl = as.factor(alldata$RoofMatl)
alldata$Exterior1st = as.factor(alldata$Exterior1st)
alldata$Exterior2nd = as.factor(alldata$Exterior2nd)
alldata$MasVnrType = as.factor(alldata$MasVnrType)
alldata$MasVnrArea = as.integer(alldata$MasVnrArea)
alldata$ExterQual = as.factor(alldata$ExterQual)
alldata$ExterCond = as.factor(alldata$ExterCond)
alldata$Foundation = as.factor(alldata$Foundation)
alldata$BsmtQual = as.factor(alldata$BsmtQual)
alldata$BsmtCond = as.factor(alldata$BsmtCond)
alldata$BsmtExposure = as.factor(alldata$BsmtExposure)
alldata$BsmtFinType1 = as.factor(alldata$BsmtFinType1)
alldata$BsmtFinSF1 = as.integer(alldata$BsmtFinSF1)
alldata$BsmtFinType2 = as.factor(alldata$BsmtFinType2)
alldata$BsmtFinSF2 = as.integer(alldata$BsmtFinSF2)
alldata$BsmtUnfSF = as.numeric(alldata$BsmtUnfSF)
alldata$TotalBsmtSF = as.integer(alldata$TotalBsmtSF)
alldata$Heating = as.factor(alldata$Heating)
alldata$CentralAir = as.factor(alldata$CentralAir)
alldata$Electrical = as.factor(alldata$Electrical)
alldata$BsmtFullBath = as.numeric(alldata$BsmtFullBath)
alldata$BsmtHalfBath = as.numeric(alldata$BsmtHalfBath)
alldata$HeatingQC = as.factor(alldata$HeatingQC)
alldata$KitchenQual = as.factor(alldata$KitchenQual)
alldata$Functional = as.factor(alldata$Functional)
alldata$FireplaceQu = as.factor(alldata$FireplaceQu)
alldata$GarageType = as.factor(alldata$GarageType)
alldata$GarageFinish = as.factor(alldata$GarageFinish)
alldata$GarageCars = as.integer(alldata$GarageCars)
alldata$GarageArea = as.numeric(alldata$GarageArea)
alldata$GarageQual = as.factor(alldata$GarageQual)
alldata$GarageCond = as.factor(alldata$GarageCond)
alldata$PavedDrive = as.factor(alldata$PavedDrive)
alldata$PoolQC = as.factor(alldata$PoolQC)
alldata$Fence = as.factor(alldata$Fence)
alldata$MiscFeature = as.factor(alldata$MiscFeature)
alldata$SaleType = as.factor(alldata$SaleType)
alldata$SaleCondition = as.factor(alldata$SaleCondition)
train = subset(alldata[1:1460,])
test = subset(alldata[1461:2919,])
str(train)
str(test)
train1 = data.frame(train,SalePrice = Sale_Price)
str(train1)
nrow(train1)
NROW(train1$SalePrice)
Model1 = lm(SalePrice ~., data = train1)
summary(Model1)
Model2 = lm(SalePrice ~ MSZoning + LotArea + Street + LotConfig + LandSlope + Neighborhood + Condition1 + Condition2 + OverallQual + OverallCond + YearBuilt + RoofStyle + RoofMatl + MasVnrArea + ExterQual + BsmtQual + BsmtCond + BsmtExposure + BsmtFinSF1 + BsmtFinSF2 + BsmtUnfSF + X1stFlrSF + X2ndFlrSF + BedroomAbvGr + KitchenAbvGr + KitchenQual + Functional + GarageCars + GarageArea + GarageQual + GarageCond + PavedDrive + WoodDeckSF + OpenPorchSF + EnclosedPorch + ScreenPorch + PoolArea + PoolQC + Fence + MiscFeature + MiscVal + MoSold + YrSold + SaleType + SaleCondition, data = train1)
summary(Model2)
Model3 = lm(SalePrice ~ MSZoning + LotArea + Street + LandSlope + Neighborhood + Condition1 + Condition2 + OverallQual + OverallCond + YearBuilt + RoofMatl + MasVnrArea + ExterQual + BsmtQual + BsmtExposure + BsmtFinSF1 + BsmtFinSF2 + BsmtUnfSF + X1stFlrSF + X2ndFlrSF + BedroomAbvGr + KitchenQual + Functional + GarageQual + GarageCond + PoolArea + PoolQC, data = train1)
summary(Model3)
Model4 = lm(SalePrice ~ MSZoning +LotArea + Neighborhood + Condition2 + OverallQual + OverallCond + YearBuilt + RoofMatl + ExterQual + BsmtQual + BsmtExposure + BsmtFinSF1 + BsmtFinSF2 + BsmtUnfSF + X1stFlrSF + X2ndFlrSF + BedroomAbvGr + KitchenQual + GarageQual + GarageCond + PoolArea + PoolQC, data = train1)
summary(Model4)
residuals(Model4)
pred1 = predict(Model4, type = 'response', newdata = test)
summary(pred1)
prediction = exp(predict(Model4, type = 'response', newdata = test))
prediction
confint(Model4, conf.level = 0.95)
plot(Model4)
NROW(pred1)
str(test)
Solution = data.frame(ID = test$Id,Saleprice = pred1,check.rows = F)
write.csv(Solution, file = "House_PredictionKG.csv",row.names = F)
