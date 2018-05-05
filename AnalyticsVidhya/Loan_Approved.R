loantrain = read.csv('./data/loan_train.csv',header = T, na.strings = c(""))
loantest = read.csv('./data/loan_test.csv',header = T, na.strings = c(""))
str(loantrain)
str(loantest)
summary(loantrain)
as.data.frame(colSums(is.na(loantrain)))
as.data.frame(colSums(is.na(loantest)))
barplot(table(loantrain$Loan_Status))
prop.table(table(loantrain$Loan_Status))
prop.table(table(loantrain$Gender))
prop.table(table(loantest$Gender))
prop.table(table(loantrain$Married))
prop.table(table(loantest$Married))
prop.table(table(loantrain$Dependents))
prop.table(table(loantest$Dependents))
par(mfrow=c(1,2))
boxplot(loantrain$ApplicantIncome,loantrain$CoapplicantIncome,names=c("App Income","Coapp Income"),main="train set")
boxplot(loantest$ApplicantIncome,loantest$CoapplicantIncome,names=c("App Income","Coapp Income"),main="test set")
par(mfrow=c(1,2))
boxplot(loantrain$LoanAmount,main="train set")
boxplot(loantest$LoanAmount,main="test set")        
par(mfrow=c(1,2))
loantrain$Credit_History = as.factor(loantrain$Credit_History)
loantest$Credit_History = as.factor(loantest$Credit_History)
barplot(table(loantrain$Credit_History),main="train set")
barplot(table(loantest$Credit_History),main="test set")
prop.table(table(loantrain$Credit_History))
prop.table(table(loantest$Credit_History))
prop.table(table(loantrain$Property_Area))
prop.table(table(loantest$Property_Area))
print(ggplot(loantrain, aes(x=Loan_Status))+geom_bar()+facet_grid(.~Gender)+ggtitle("Loan Status by Gender of Applicant"))
library(ggplot2)
print(ggplot(loantrain, aes(x=Loan_Status))+geom_bar()+facet_grid(.~Married)+ggtitle("Loan Status by Marital Status of Applicant"))
print(ggplot(loantrain, aes(x=Loan_Status,y=ApplicantIncome))+geom_boxplot()+ggtitle("Loan Status by Applicant income"))
alldata = rbind(loantrain[,2:12],loantest[,2:12])
print(ggplot(data=alldata[alldata$ApplicantIncome<20000,],aes(ApplicantIncome,fill=Married))+geom_bar(position="dodge")+facet_grid(Gender~.))
print(ggplot(data=alldata[alldata$ApplicantIncome<20000,],aes(CoapplicantIncome,fill=Married))+geom_bar(position="dodge")+facet_grid(Gender~.))
library(plyr)
alldata2 = mutate(alldata,TotalIncome=ApplicantIncome+CoapplicantIncome)
print(ggplot(data=alldata2,aes(TotalIncome,fill=Married))+geom_bar(position="dodge")+facet_grid(Gender~.))
alldata2$Married[is.na(alldata2$Married) & alldata2$CoapplicantIncome==0] = "No"
alldata2$Married[is.na(alldata2$Married)] = "Yes"
alldata2[is.na(alldata2$Gender) & is.na(alldata2$Dependents),]
alldata2$Gender[is.na(alldata2$Gender) & is.na(alldata2$Dependents)] = "Male"
print(ggplot(alldata2,aes(x=Dependents, fill=Gender)) + geom_bar() + facet_grid(.~Married))
alldata2$Dependents[is.na(alldata2$Dependents) & alldata2$Married=="No"] = "0"
mm = alldata2[(alldata2$Gender=="Male" & alldata2$Married=="Yes"),c(3,6:9,11)]
mmtrain = mm[!is.na(mm$Dependents),]
mmtest = mm[is.na(mm$Dependents),]
library(rpart)
depFit = rpart(data=mmtrain,Dependents~.,xval=3)
p = predict(depFit,mmtrain,type = 'class')
acc = sum(p==mmtrain[,1])/length(p)
acc
alldata2$Dependents[is.na(alldata2$Dependents) & alldata2$Gender=="Male" & alldata2$Married == "Yes"] = predict(depFit,newdata=mmtest,type="class")
gtrain = alldata2[!is.na(alldata2$Gender),1:7]
gtest = alldata2[is.na(alldata2$Gender),1:7]
genFit = rpart(data=gtrain,Gender~.,xval=3)
p = predict(genFit,gtrain,type="class")
acc = sum(p==gtrain[,1])/length(p)
acc
alldata2$Gender[is.na(alldata2$Gender)] = predict(genFit,gtest,type="class")
alldata2$Self_Employed[is.na(alldata$Self_Employed)] = "No"
library(car)
alldata2$Credit_History = recode(alldata2$Credit_History,"NA=2")
ltrain = alldata2[!is.na(alldata2$LoanAmount) & alldata2$LoanAmount<500,c(1:8,10)]
ltest = alldata2[is.na(alldata2$LoanAmount),c(1:8,10)]
loanFit = glm(data=ltrain,LoanAmount~.,na.action=na.exclude)
alldata2$LoanAmount[is.na(alldata2$LoanAmount)] = predict(loanFit,newdata=ltest)
alldata2$Loan_Amount_Term = as.factor(alldata2$Loan_Amount_Term)
print(ggplot(data=alldata2,aes(x=Loan_Amount_Term))+geom_bar())
alldata2$Loan_Amount_Term[is.na(alldata2$Loan_Amount_Term)] = "360"
alldata2$Loan_Amount_Term = recode(alldata2$Loan_Amount_Term,"'350'='360';'6'='60'")
numDependents = recode(alldata2$Dependents,"'3+'='3' ")
numDependents = as.numeric(as.character(numDependents))
alldata2$FamilySize = ifelse((alldata2$CoapplicantIncome>0 |alldata2$Married=="Y"),numDependents+2,numDependents+1)
alldata2$IncomePC = alldata2$TotalIncome/alldata2$FamilySize
alldata2$LoanAmountByTotInc = alldata2$LoanAmount/alldata2$TotalIncome
alldata2$LoanAmountPC = alldata2$LoanAmount/alldata2$IncomePC
alldata2$Loan_Amount_Term = as.numeric(as.character(alldata2$Loan_Amount_Term))
alldata2$LoanPerMonth = alldata2$LoanAmount/alldata2$Loan_Amount_Term
alldata2$LoanPerMOnthByTotInc  = alldata2$LoanPerMonth/alldata2$TotalIncome
alldata2$LoanPerMonthPC = alldata2$LoanPerMonth/alldata2$LoanAmountPC
alldata2$Loan_Amount_Term = as.factor(alldata2$Loan_Amount_Term)
bins = cut(alldata2$ApplicantIncome,breaks=20)
barplot(table(bins),main="Applicant Income")
logbins = cut(ifelse(alldata2$ApplicantIncome<2.72,0,log(alldata2$ApplicantIncome)),breaks=20)
barplot(table(logbins),main="Log of Applicant Income")
alldata2$LogApplicantIncome = ifelse(alldata2$ApplicantIncome<2.72,0,log(alldata2$ApplicantIncome))
alldata2$LogCoapplicantIncome = ifelse(alldata2$CoapplicantIncome<2.72,0,log(alldata2$CoapplicantIncome))
summary(alldata2$LoanAmount)
alldata2$LogLoanAmount = log(alldata2$LoanAmount)
summary(alldata2$TotalIncome)
alldata2$LogTotalIncome = log(alldata2$TotalIncome)
summary(alldata2$IncomePC)
alldata2$IncomePC = log(alldata2$IncomePC)
summary(alldata2$LoanAmountByTotInc)
summary(alldata2$LoanAmountPC)
alldata2$LogLoanAmountPC = log(1000*alldata2$LoanAmountPC)
summary(alldata2$LoanPerMonth)
alldata2$LogLoanPerMOnth = log(alldata2$LoanPerMonth)
summary(alldata2$LoanPerMOnthByTotInc)
summary(alldata2$LoanPerMonthPC)
alldata2$LogLoanPerMOnthPC = log(alldata2$LoanPerMonthPC)
alldata2$LogLoanPerMOnthPC = log(alldata2$LoanPerMonthPC)
nums = sapply(alldata2,class)=="numeric"
numvars = alldata2[,nums]
m = cor(numvars)
v = as.vector(m)
id1 = rep(rownames(m),17)
id2 = as.vector(sapply(rownames(m),function(x)rep(x,17)))
d = data.frame(v,id1,id2)
d
d = d[d$v>0.8 & d$v<1,]
d
d = d[c(1:5,8),]
alldata2 = alldata2[,!(names(alldata2) %in% d$id1)]
newtrain = cbind(Loan_Status=loantrain$Loan_Status,alldata2[1:614,])
Loan_Status = as.factor(sample(c("N","Y"),replace=TRUE,size=dim(loantest)[1]))
newtest = cbind(Loan_Status,alldata2[615:981,])
trainTask = makeClassifTask(data = newtrain,target = "Loan_Status")
testTask = makeClassifTask(data = newtest, target = "Loan_Status")
library(mlr)
trainTask = normalizeFeatures(trainTask,method = "standardize")
testTask = normalizeFeatures(testTask,method = "standardize")
tree = makeLearner("classif.rpart", predict.type = "response")
set_cv = makeResampleDesc("CV",iters = 3L)
treepars = makeParamSet(makeIntegerParam("minsplit",lower = 10, upper = 50),
  makeIntegerParam("minbucket", lower = 5, upper = 50),
  makeNumericParam("cp", lower = 0.001, upper = 0.2))
tpcontrol = makeTuneControlRandom(maxit = 100L)
rm(acc)
set.seed(11)
treetune = tuneParams(learner = tree, resampling = set_cv, 
                       task = trainTask, par.set = treepars, control = tpcontrol, measures = acc)
treetune
tunedtree = setHyperPars(tree, par.vals=treetune$x)
treefit = train(tunedtree, trainTask)
par(mfrow=c(1,1))
treepred = predict(treefit, testTask)
rf = makeLearner("classif.randomForest", predict.type = "response"
                  , par.vals = list(ntree = 200, mtry = 3))
rf$par.vals = list(importance = TRUE)
rf_param = makeParamSet(makeIntegerParam("ntree",lower = 50, upper = 500),makeIntegerParam("mtry", lower = 2, upper = 10),makeIntegerParam("nodesize", lower = 10, upper = 50))
rancontrol = makeTuneControlRandom(maxit = 100L)
set_cv = makeResampleDesc("CV",iters = 3L)
set.seed(11)
rf_tune = tuneParams(learner = rf, resampling = set_cv, task = trainTask, par.set = rf_param, control = rancontrol, measures = acc)
rf_tune$y
rf_tune$x
tunedrf = setHyperPars(rf, par.vals = rf_tune$x)
rforest = train(tunedrf, trainTask)
getLearnerModel(rforest)
rfmodel = predict(rforest, testTask)
submit2 = data.frame(Loan_ID = loantest$Loan_ID, Loan_Status = rfmodel$data$response)
write.csv(submit2, file = "LoanPredict2.csv",row.names = F)
submit1 = cbind(submit$Loan_Status,submit2$Loan_Status)
sum(submit1[,1]==submit1[,2])
library(randomForest)
varImpPlot(rforest$learner.model)

