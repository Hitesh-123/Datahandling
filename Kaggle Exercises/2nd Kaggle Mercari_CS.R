trainset = read.csv(file = './data/mercari_train.csv')
testset = read.csv(file = './data/mercari_test.csv')
str(trainset)
names(trainset)
names(testset)
str(testset)
trainset$item_description = as.character(trainset$item_description)
table(trainset$name)
item_price = trainset$price
item_price
item_price = NULL
mean(sapply(sapply(trainset$item_description, strsplit, " "), length))
corpus = Corpus(VectorSource(c(trainset$item_description, testset$item_description)))
corpus
corpus = tm_map(corpus, content_transformer(tolower))
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, stripWhitespace)
corpus = tm_map(corpus, stemDocument)
corpus = tm_map(corpus, removeWords, stopwords("english"))
dtm = DocumentTermMatrix(corpus)
dtm
sparse = removeSparseTerms(dtm, 0.99)
sparse
important_words_df = as.data.frame(as.matrix(sparse))
important_words_df
colnames(important_words_df) = make.names(colnames(important_words_df))
colnames(important_words_df)
important_words_train_df = head(important_words_df, nrow(trainset))
important_words_test_df = tail(important_words_df, nrow(testset))
train_data_words_df = cbind(trainset, important_words_train_df)
test_data_words_df = cbind(testset, important_words_test_df)
train_data_words_df
test_data_words_df
train_data_words_df$item_description = NULL
test_data_words_df$item_description = NULL
library(caTools)
set.seed(1234)
spl = sample.split(train_data_words_df$price, .80)
spl
