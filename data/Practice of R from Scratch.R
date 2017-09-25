a = 3
a
b = sqrt(a*a + 3)
b
ls()
a = c(1,2,3,4,5)
a
a + 1
mean(a)
var(a)
a[1]
a[2]
a[0]
a[6]
a = numeric(15)
a
typeof(a)
a = "hello"
a
b = c("hello","there")
b
b[1]
b[2]
typeof(b)
a = character(25)
a
summary(tree$mtcars)
summary(tree$CHBR)
tree$C
mtcars
summary(mtcars)
x = 20
if(is.numeric(x))
{
  print('x is an integer')
}
x = "a"
if(is.numeric(x))
{
  print('x is an integer')
}
print('byee')
x = 45
if(x == 45){
  print("hello")
}else{
  print("byee")
}
x = 20
y = 40
if(x == 25){
  print("hello")
}else if(y == 50){
  print("byee")
}else{
  print("get lost")
}
x = 130
if(x == 24){
  print("hello")
}else if(x == 130){
  print("yes")
}else{
  print("bhaag")
}
a = c(100,200,300,400)
a = 2
a*3
a = 1:20
a
len(a)
length(a)
b = 4:40
b
a + b
b = 41 : 60
b
a + b
a * b
a = 1:10
a
for(i in a)
(
  print(i)
)
  a = 3 
  while(a < 10)
  {
    print("hello")
    a = a + 1
  }
a = 1:10
a
b = 3:6
b
any(a < 5)
all(a < 5)
a + b
a < 5
M = matrix(c(1:9),nrow = 3, ncol = 3, byrow = F,dimnames = list(rownames,colnames))
M
rownames = c('row1','row2','row3')
rownames
colnames = c('col1','col2','col3')
colnames
N = matrix(c(3:14),nrow = 3, ncol = 3, byrow = F,dimnames = list(rownames,colnames))
N
add = M * N
add
Q = data.frame(M,N)
Q
id = c(1:10)
id
name = c("hitesh","goldie","lalit","vijay","shruti","meena","apoorva","ishan","dharna","dhiraj")
name
marks = c(25,30,24,23,16,18,29,30,26,25)
marks
df1 = data.frame(id,name,marks)
df1
head(df1)
tail(df1)
df1$marks
df1[2]
df1[1,2]
df1[,3]
df1[3,]
df1[3,1:2]
y = list(id,"hitesh",c(1:4),df1)
y
names(y) = c('ids',"name","vector","df2")
names(y)
y[('vector')]
y[["hitesh"]] = "mann"
y
df2 = read.csv(file='./data/dsstudents2.csv')
df2
a = c(1,2,5,6,-2,4)
a
b = c("one", "two", 'three')
b
c <- c(TRUE, FALSE, T,F,TRUE,FALSE)
c
a ; b; c
mydata = data.frame(col1,col2,col3)
patientid = c(1,2,3,4)
patientid
age = c(25,34,28,52)
age
diabetes = c('Type1','Type2','Type1','Type1')
diabetes
status = c('Poor','Improved','Excellent','Poor')
status
patientdata = data.frame(patientid,age,diabetes,status)
patientdata
rollno = c(17010,17045,17012,17087,17057,17056,17032,17084,17078,17018,17013)
rollno
sname = c('Achal Kumar','Apoorva Karn','Goldie Sahni','Hitesh Mann','Kaustav Chatterjee','Meena Srisha Valavala','Rashmi Ranjan Mangaraj','Shruti Sinha','Shubham Pujan','Vijay Pal Singh','Lalit Sahni')
sname
course = c('PGDDS','PGDDS','PGDDS','PGDDS','MSCDS','PGDDS','MSCDS','PGDDS','PGDDS','PGDDS','PGDDS')
course
gender = c('M','F','M','M','M','F','M','F','M','M','M')
exp =  c(3,3.5,14,5,0,1,1,15,1,3,8)
hostel =  c(FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,TRUE)
rollno ;sname ; course ; gender ; hostel
sdata = data.frame(rollno, sname, course, gender, exp, hostel)
sdata
sdata$hostel[sdata$rollno==17057] = TRUE
sdata
rollno2 = c(10,11,12,13)
rollno2
sname2 = c('Achal','Apoorva','Goldie','Hitesh')
sname2
gender2 = c('M','F','M','M')
gender2
sdata2 = data.frame(rollno2, sname2, gender2)
sdata2
colnames(sdata2) = c("rollno1", "name1", "gender1")
sdata2
sdata3 = data.frame(rollno3 = rollno2, sname3= sname2,  gender3=gender2)
sdata3
diabetes = factor(diabetes)
diabetes
status = c('Poor','Improved','Excellent','Poor')
status = factor(status)
status
status = factor(status, ordered=T)
status
g = 'My first list'
g
h = c(25,26,18,39)
j = matrix(1:10,nrow=5)
k = c("one",'two','Three')
mylist = list(title=g,ages=h,j,k)
mylist
