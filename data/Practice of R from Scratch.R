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
