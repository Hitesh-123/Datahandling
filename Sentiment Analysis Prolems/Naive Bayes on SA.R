tweets = read.csv('./data/paytm.csv', header = T, na.strings = c(""), stringsAsFactors = F)
str(tweets)
tweets$Time = NULL
library(tm)
library(NLP)
corpus = Corpus(VectorSource(tweets$Tweets))
removeURL = content_transformer(function(x) gsub("(f|ht)tp(s?)://\\S+", "", x, perl=T))
corpus = tm_map(corpus, removeURL)
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, stripWhitespace)
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, removeWords, c(stopwords("english"),'paytm'))
corpus = tm_map(corpus,removeNumbers)
dtm = DocumentTermMatrix(corpus)
dtm
sparse = removeSparseTerms(dtm, 0.99)
sparse
df1 = as.data.frame(as.matrix(sparse))
df2 = read.csv('./TweetSentimentScore.csv')
head(df2)
df1$sentiment = df2$sentiment 
head(df1$sentiment)
library(caTools)
set.seed(123)
x = sample.split(df1$sentiment,SplitRatio = 0.7)
train = df1[x==T,]
test = df1[x==F,]
library(e1071)
Model1 = naiveBayes(sentiment~.,data = train)
summary(Model1)
pred = predict(Model1,newdata = test)
pred[1:5]
table(pred,test$sentiment)
244+629+192+11+186+36+7+54+340
(244+186+340)/1699
# 0.45

