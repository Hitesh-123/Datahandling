getwd()
df2 = read.csv(file='./data/dsstudents2.csv')
df2
str(df2)
names(df2)
df2a = read.csv(file=file.choose())
colcls = c('numeric',NA,'factor','factor','logical','character','numeric','character','character','character',rep('numeric',4))
colcls
df2b = read.csv(file='./data/dsstudents2.csv',stringsAsFactors = F)
df2b
str(df2b)
df3 = read.csv(file='./data/dsstudents2.csv',colClasses=colcls,as.is=T)
df3
str(df3)
as.Date('1967-20-15')  #error
as.Date('1967-10-15')  # right default %y-%b-%d
as.Date('05-Oct-1967',format='%d-%b-%Y')
as.Date('05-10-1967',format='%d-%b-%Y')
as.Date('05-Oct-67',format='%d-%b-%y')
str(df3$dob)
head(df3$dob)
(df3$dob=as.Date(df2$dob,format='%d-%b-%y'))
str(df3$dob)
Sys.Date()-df3$dob
difftime(Sys.Date(),df3$dob,unit ='weeks')
(df3$age = ceiling(as.numeric(difftime(Sys.Date(),df3$dob,unit='weeks'))/52.25))
head(df3$age)
cat(names(df3))
df3[df3$age>30,][1:2]
df3[df3$gender=='M' & df3$course=='PGDDS',][1:2]
df3[df3$hostel==T & df3$fees==T,][1:2]
write.csv(df3,file = './data/hitesh.csv')
saveRDS(object = df3,file = './data/Hitesh2.rds')
saveRDS()
markstotal = runif(11,50,150)
markstotal
save(markstotal,df3,file = './data/hitesh3.RData')
save.image(file = './data/hitesh4.RData')
save.image()
readRDS(file = './data/Hitesh2.RDS')
mydata = readRDS(file = './data/Hitesh2.RDS')
load(file = './data/hitesh3.RData')
load(file = './data/hitesh4.RData')
df3$age > 30 # by age
df3[df3$gender == 'M' & df3$course == 'PGDDS',c('rollno','name')]
df3[df3$gender == 'M' & df3$course == 'PGDDS',c(1,2)]
df3[df3$hostel == TRUE,][1:2]   # stay in hostel
which(df3$hostel == TRUE)  # using which command tells indices
df3[,c('rollno','hostel')]
df3[c(1,3,5,7,9),c(1,2)]
df3[which(df3$hostel == TRUE),][c(1,2,4,5)]
df3[which(df3$hostel == FALSE),][c(1,2,4,5)]
df3
df3$name[order(df3$age)]
df3$name[order(-df3$age)]
A1 = c(22,23,24,24,26,26,27,27,30,38,38)
A1
df3$age = A1
df3
df3$name[rev(order(df3$age))]
rev(sort(df3$age))
df3[order(df3$age),1:4]
df3[order(df3$age),1:4][1:4]
df3[order(df3$age),1:4][1:3,]
df3[order(df3$age),1:4][c(1,2,5,7),]
df3[order(df3$hostel,df3$age),c('name','age','hostel')]
df3[order(-df3$hostel,df3$age),c('name','age','hostel')]
df3[order(df3$fees,decreasing = TRUE),c('name','age','fees')]
df3$fees
df3 = readRDS(file = './data/Hitesh2.RDS')
df3
df3$fees
feestatus = function(x) {
  if(x >= 150000)
    print(paste(i,df3$name[i],x,'- Fees Paid'))
  else
    print(paste(i,df3$name[i],x,'- Fees Not Paid - xxxx'))
}
for (i in c(1:11)) {
  feestatus(df3$fees[i])
}
?aggregate
split(df3[1:3],df3$gender)
split(df3[1:3],df3$hostel)
class(split(df3[1:3],df3$gender))
df = read.csv(file = './data/dsstudents2.csv')
df
str(df)
summary(df)
is.na(df)
anyNA(df)
table(is.na(df))
all(is.na(df))
all(is.na(df)==F)
all(is.na(df)==T)
all(is.na(df)==F & is.na(df)==T)
df
complete.cases(df)
!complete.cases(df)
sum(complete.cases(df))
sum(!complete.cases(df))
df[complete.cases(df),][1:2]
mean(df$excel)
mean(df$excel,na.rm = T)
mean(df$excel,na.rm = T,trim = .2)
mean(df$excel,na.rm = T,trim = .4)
na.omit(df$excel)
na.omit(df)[1:2]
colSums(is.na(df))
apply(df,2,function(x) sum(is.na(x)))
apply(is.na(df),2,sum)
Amelia::missmap(df)
?reshape
length(which(is.na(df['excel']==T)))
sum(is.na(df$excel))
mean(df$excel,na.rm = T)
df$excel
df$excel[is.na(df$excel)] = mean(df$excel,na.rm = T)
df$excel
ma
df$sql[is.na(df$sql)] = mean(df$stats,na.rm = T)
df$sql
colSums(is.na(df))
na_count = sapply(df,function(y) sum(length(which(is.na(y)))))
(na_count = data.frame(na_count))

df = read.csv(file = './data/dsstudents2.csv')
df
