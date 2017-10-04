# reading dsstudents2 file and define the file as df3
df3 = read.csv(file='./data/dsstudents2.csv')
df3
str(df3) # checking structure of df3  
summary(df3)  # summary of df3
names(df3) # column names present in df3
class(df3) # class of df3
nrow(df3) # number of rows
ncol(df3) # number of columns
dim(df3) # dimensions of df3
cat(names(df3)) # column names without string
colcls = c('numeric',NA,'factor','factor','logical','character','numeric','character','character','character',rep('numeric',4))
colcls # vector of colcls
df3a = read.csv(file='./data/dsstudents2.csv',stringsAsFactors = F)
df3a
str(df3a)
df3b = read.csv(file='./data/dsstudents2.csv',colClasses=colcls,as.is=T)
df3b
length(colcls)
is.na(df3a) # find the na values in dataset
anyNA(df3a) # find true(dataset contains na values)
table(is.na(df3a)) # gives the number of na values
all(is.na(df3a)) # shows false(not all values are na)
# finding age & create a new column
df3b$dob = as.Date(df3b$dob,format = "%d-%b-%y")
df3b$dob
class(df3b$dob) # class of the dataset
difftime(Sys.Date(),df3b$dob,units = "weeks") # shows the time diffrence in weeks(decimals)
df3b$age = ceiling(as.numeric(difftime(Sys.Date(),df3b$dob,units = "weeks"))/52.5)
df3b$age
str(df3b$age)

# missing values
complete.cases(df3b) # show the students information whether is complete or not
all(is.na(df3b))
all(is.na(df)==F)
all(is.na(df3b)==F|is.na(df3b)==T)
sum(complete.cases(df3b)) # sum of those students whose information is complete(without NA)
sum(!complete.cases(df3b)) # sum of incomeplete sttudents info
df3b[complete.cases(df3b),][1,2] # name and rollno of complete cases
df3b[!complete.cases(df3b),][1,2] # name and roll no of complete case of 1 student
# removing na values with mean
mean(df3b$excel)
mean(df3b$excel,na.rm = T) # removes na value from excel column
mean(df3b$excel,na.rm = T,trim = .2)
mean(df3b$excel,trim = .2)
df3b$excel
# removing na values from sql
mean(df3b$sql)
mean(df3b$sql,na.rm = T)
df3b$sql
df3b$sql[is.na(df3b$sql)] = mean(df3b$sql,na.rm = T)
df3b$sql
# removing na values from fees
df3b$fees
median(df3b$fees,na.rm = T)
df3b$fees[is.na(df3b$fees)] = median(df3b$fees,na.rm = T)
df3b$fees
# removing na values from hostel
df3b$hostel
median(df3b$hostel)
median(df3b$hostel,na.rm = T)
df3b$hostel[is.na(df3b$hostel)] = median(df3b$hostel,na.rm = T)
df3b$hostel
# adding up a new row
df3c = data.frame(17000,'Ramesh Singh','MSC',NA,TRUE, '1994-10-17', 50000,
                  'ramesh@gmail.com',NA,'Delhi',NA,NA,NA,NA,NA) #creating one row dataframe
df3c
str(df3c)
names(df3c) = c('rollno','name','course','gender','hostel','dob','fees','email','mobno','city','rpgm','excel','sql','stats','age')
names(df3c)
names(df3b)
colnames(df3c)
ncol(df3c)
ncol(df3b)
df4 = rbind(df3b,df3c) # new data frame as df4
df4
df4$excel
mean(df4$excel)
mean(df4$excel,na.rm = T)
df4$excel[is.na(df4$excel)] = mean(df4$excel,na.rm = T)
df4$excel
df4$sql
mean(df4$sql)
mean(df4$sql,na.rm = T)
df4$sql[is.na(df4$sql)] = mean(df4$sql,na.rm = T)
df4$sql
df4$stats
mean(df4$stats)
mean(df4$stats,na.rm = T)
df4$stats[is.na(df4$stats)] = mean(df4$stats,na.rm = T)
df4$stats
df4$rpgm
mean(df4$rpgm)
mean(df4$rpgm,na.rm = T)
df4$rpgm[is.na(df4$rpgm)] = mean(df4$rpgm,na.rm = T)
df4$rpgm
df4$gender
df4$gender[is.na(df4$gender)] = 'M'
df4$gender
sum(is.na(df4))
str(df4)
df4
# creating df4a for summary like sum,mean,median in one dataframe
df4a = df4[11:14]
df4a
rownames(df4a) = df4$rollno # define rollno as rownames
df4a
addmargins(as.table(as.matrix(df4a)),c(2,2,1),list(sum,mean,median)) # addmargins to create row sum,column means,medians
# creating course vs gender summary & proportion tables
t1 = table(df4$course,df4$gender)
addmargins(t1) # summary of course vs gender
prop.table(t1) # proportion of course-gender table
# grade function & rank
df4b = df4[c(1,2,11,12,13,14)] # creating total column
df4b
df4b$total = rowMeans(df4b[,c(3:6)]) # creating a new column by the name of 'Total'
df4b$total
df4b
grades = function(x){
  if (x > 70){
    print('A')
  } else if (x >= 60 & x <= 70){
    print('B')
  } else {
    print('C')
  }
}
# creating function of grades
for (i in c(1:12)){
  df4b$grade[i] = grades(df4b$total[i]) # loop for giving grades acc to avg marks per row
}
df4b
df4b$ranks = rank(-df4b$total) # rank 1 to largest total marks
df4b
df4b$name[df4b$ranks==4] # shows Meena Srisha Valavala-4th rank holder
df4
# Row wise & Columns wise means - Pending
df5 = df4[,c(3,11,12,13,14)]
df5
#split wrt course,wrt gender-hostel
split(df4[1:3],df4$course) # split according to course
split(df4[1:3],list(df4$gender,df4$hostel)) # split wrt gender-hostel
#adding bigdata marks and scaling
bigdata = ceiling(runif(12,100,150))
bigdata
df4c = df4 # creating new dataframe - df4c
df4c
df4c$bigdata = bigdata # adding bigdata to df4c
df4c
?scale
df4c$bigdataS = scale(df4c$bigdata,center = F) # scaling bigdata marks
df4c
#creating barplot
df4d = df4c[,c('rpgm','excel','sql','stats','bigdata')]
df4d
g1 <- colMeans(df4d)
barplot(g1,main = 'Average Marks',ylim=c(0,140)) # barplot of average marks






























