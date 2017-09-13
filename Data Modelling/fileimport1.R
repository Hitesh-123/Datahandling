getwd()
dfa1 = read.csv(file = './data/dsstudents.csv')
dfa1
str(dfa1)

df2 = read.csv(file = './data/dsstudents.csv',stringsAsFactors = F)
df2
str(df2)


df2 = read.csv(file = './data/dsstudents.csv',row.names = 1)
df2
df2 = read.csv(file = './data/dsstudents.csv',row.names = c(paste('R',1:11,sep = '')))
df2
head(df2[,1:2])
df2$rollno2 = row.names(df2)
df2[,c('rollno2')]
str(df2)

df2 = read.csv(file = './data/dsstudents.csv',stringsAsFactors = F)
df2
str(df2)
head(df2)[1:4]
?read.csv
