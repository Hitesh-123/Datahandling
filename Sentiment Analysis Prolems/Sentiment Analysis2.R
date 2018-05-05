tweets = read.csv('./data/paytm.csv', header = T, na.strings = c(""), stringsAsFactors = F)
str(tweets)
tweets$Time = NULL
library(SnowballC)
library(tm)
library(NLP)
# removing markup tags, whitespace, converting to lower cas
corpus = Corpus(VectorSource(tweets$Tweets))
removeURL = content_transformer(function(x) gsub("(f|ht)tp(s?)://\\S+", "", x, perl=T))
corpus = tm_map(corpus, removeURL)
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, stripWhitespace)
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, removeWords, c(stopwords("english"),'@paytm','@Paytm'))
corpus = tm_map(corpus,removeNumbers)
df = as.data.frame(corpus$content,stringsAsFactors = F)
colnames(df) = c('col1')
df$col1[1]
v2=c()
pos = read.csv('./data/positive_words.csv')
neg = read.csv('./data/negative_words.csv')
#checking for positive & negative word counts in tweets data and saving counts in v2 vector
for (x in 1:nrow(df)){
  cnt = 0
  v1 <- strsplit(df$col1[x],' ')
  if (length(v1[[1]]) > 0){
  for (y in 1:length(v1[[1]])){
    if (nchar(v1[[1]][y]) > 0) {
      if (v1[[1]][y] %in% pos$words) {
        cnt = cnt + 1
      }
      if (v1[[1]][y] %in% neg$words) {
        cnt = cnt - 1
      } 
    } 
  }
}
v2[x] = cnt}  
tweets$score = v2
tweets$sentiment = 'Neutral'
tweets$sentiment[tweets$score>0] = 'Positive'
tweets$sentiment[tweets$score<0] = 'Negative'
head(tweets)
write.csv(tweets,file ='TweetSentimentScore.csv',row.names = F)
