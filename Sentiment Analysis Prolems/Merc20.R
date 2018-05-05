train = read.csv(file = './data/toxic_train.csv',stringsAsFactors = F)
train_set = train[1:400000,]
test = read.csv(file = './data/toxic_test.csv',stringsAsFactors = F)
colSums(is.na(train_set))
colSums(is.na(test))
str(train_set)
train_set$category_name = NULL
train_set$brand_name = NULL
str(test)
test$category_name = NULL
test$brand_name = NULL
ids = test$test_id
train_set$train_id = NULL
test$test_id = NULL
mean(sapply(sapply(train_set$item_description, strsplit, " "), length))
library(NLP)
library(tm)
# vectorizing name
print('vectorizing name')
corpus1 = Corpus(VectorSource(c(train_set$name, test$name)))
corpus1 = tm_map(corpus1, content_transformer(tolower))
corpus1 = tm_map(corpus1, removePunctuation)
corpus1 = tm_map(corpus1, stripWhitespace)
corpus1 = tm_map(corpus1, stemDocument)
corpus1 = tm_map(corpus1, removeWords, stopwords("english"))
dtm = DocumentTermMatrix(corpus1)
sparse = removeSparseTerms(dtm, 0.99)
important_words_df = as.data.frame(as.matrix(sparse))
important_words_df = important_words_df[, !duplicated(colnames(important_words_df))]
print('important_words_df dim')
dim(important_words_df)
colnames(important_words_df) = make.names(colnames(important_words_df))
important_words_train_df = head(important_words_df, nrow(train_set))
important_words_test_df = tail(important_words_df, nrow(test))
print('important_words_train_df dim')
dim(important_words_train_df)
print('important_words_test_df dim')
dim(important_words_test_df)
print('combining1')
train_data_words_df = cbind(train_set, important_words_train_df)
test_data_words_df = cbind(test, important_words_test_df)
dim(train_data_words_df)
train_data_words_df$name = NULL
test_data_words_df$name = NULL
#vectorizing item_description
print('vectorizing item_description')
corpus2 = Corpus(VectorSource(c(train_set$item_description, test$item_description)))
corpus2 = tm_map(corpus2, content_transformer(tolower))
corpus2 = tm_map(corpus2, removePunctuation)
corpus2 = tm_map(corpus2, stripWhitespace)
corpus2 = tm_map(corpus2, stemDocument)
corpus2 = tm_map(corpus2, removeWords, stopwords("english"))
dtm1 = DocumentTermMatrix(corpus2)
sparse1 = removeSparseTerms(dtm1, 0.99)
important_words_df1 = as.data.frame(as.matrix(sparse1))
important_words_df1 = important_words_df1[, !duplicated(colnames(important_words_df1))]
colnames(important_words_df1) = make.names(colnames(important_words_df1))
important_words_train_df1 = head(important_words_df1, nrow(train_set))
important_words_test_df1 = tail(important_words_df1, nrow(test))
print('combining2')
train_data_words_df1 = cbind(train_data_words_df, important_words_train_df1)
test_data_words_df1 = cbind(test_data_words_df, important_words_test_df1)
price1 = train_data_words_df1$price
train_data_words_df1$price = NULL
df = data.frame(words = unlist(words))
combo1 = cbind(train_data_words_df1,test_data_words_df1)
combo1 = combo1[, !duplicated(colnames(combo1))]
#train_data_words_df1 <- train_data_words_df1[, !duplicated(colnames(train_data_words_df1))]
#test_data_words_df1 <- test_data_words_df1[, !duplicated(colnames(test_data_words_df1))]
print('deduplicated')
dim(combo1)
train_data_words_df3 = head(combo1,nrow(train_set))
test_data_words_df3 = tail(combo1,nrow(test))
train_data_words_df3$item_description = NULL
test_data_words_df3$item_description = NULL
#train_data_words_df3$price = price1
print('train_data_words_df3 dim')
dim(train_data_words_df3)
print('test_data_words_df3 dim')
dim(test_data_words_df3)
#removing trainset,testset,train_data_words_df,test_data_words_df
rm(trainset)
rm(testset)
rm(train_data_words_df)
rm(test_data_words_df)
rm(train_data_words_df1)
rm(test_data_words_df1)
rm(combo)
# modelling
#train_data_words_df1 <- train_data_words_df1[, !duplicated(colnames(train_data_words_df1))]
library('biglm')
#rm(train_data_words_df2)
train_data_words_df2 = train_data_words_df3[,1:150]
test_data_words_df2 = test_data_words_df3[,1:150]
train_data_words_df2$prices = price1
dim(train_data_words_df2)
dim(test_data_words_df2)
sp1 = split(train_data_words_df2, (seq(nrow(train_data_words_df2))-1) %/% 20000)
print('split')
m1 = biglm(terms(prices~.,data=sp1[[1]]),data=sp1[[1]])
for (x in 2:20){
  m1 = update(m1,sp1[[x]])
  print(x)
}
print('model done')
print('updating done')
test_data_words_df2$prices = 0
pred = predict(m1,newdata=test_data_words_df2)
pred[1:10]
pred1 = ifelse(pred>0,pred,0)
pred1[1:10]
print('predicted')
sub1 = data.frame(ids)
str(sub1)
sub1$test_id = sub1$ids
sub1$ids = NULL
sub1$price = pred1
write.csv(sub1,file="Merc20R.csv",row.names = F)


--------------------------------------------------------------------------------------------------


for (x in 2:5){
  m1 = update(m1,sp1[[x]])
  print(x)
}
