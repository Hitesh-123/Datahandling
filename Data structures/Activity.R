x = scan()  # use to copy the data from excel to R
43
60
37
48
65
48
57
78
31
59
50
x
y = scan()
?scan
y = scan(what = 'character')
x = 1:12
x = c(1:12,1,5,5)
x
table(x)
names(table(x))
sort(table(x))
sort(table(x),dec = T)
names(table(x))[1]
names(sort(table(x),dec = T))[1]
set.seed(1234)
x = ceiling(rnorm(100,60,15)) # exercise for normal distribution
x
mean(x)
median(x)
table(x)
range(x)
breaks = seq(min(x),max(x),10) # use to make the class intervals
breaks = seq(20,100,10)
?cut
breaks = seq(0,100,by=10)
breaks
marks.cut = cut(marks,breaks)
x.cut = cut(x,breaks)
x.cut
x.table = table(x.cut)
x.table
cbind(x.table)
hist(x)
hist(x,breaks=10)


set.seed(1234)
marks = ceiling(rnorm(100,60,15))
marks
range(marks)
mean(marks)
marks[c(1,2,3,4,5)] = c(0,10,11,99,100)
head(marks,n=5)
(bks = seq(0,100,10))  # 10 intervals(to display the values also)
# slabs : 0-10,20-30 ....
classint1 = cut(marks, bks)  # default right = T
head(classint1,cuts,n=5)
classint2 = table(classint1,useNA = 'ifany')
classint2
cbind(classint2)
hist(classint2)
hist(classint2,breaks=10)
table(classint2, useNA = 'ifany')
classint2a = cut(marks, bks, include.lowest = T) # default right=T
classint2a
as.character(head(classint2a,n=5))
head(marks,n=5)
#Giving Labels
clasintb = cut(marks,bks,include.lowest = T,labels = LETTERS[1:length(bks)-1]) # default right=F
clasintb
LETTERS[1:5]; letters[1:8]; month.abb[1:5]
LETTERS[1:length(bks)-1])
x1 = c(0,2,5.1,3,10,14.5,15,16,20)
x1
cut(x1,breaks = 4,include.lowest = T) # not look good
#Levels: [-0.02,5] (5,10] (10,15] (15,20]
hist(mtcars$mpg)
hist
pin(width,height)
par()
par(pin=c(6,7))
par(col.lab = 'red') #to change the color of label
opar = par(no.readonly = T)
opar
par(opar)  #reset to defaults after making the changes
par(mar)
par('mar')  #parameter of margin in cms
par('mai') #parameter of margin in inches
hist(mtcars$mpg)
par(mar = c(1,1,1,1))
par('mar')
hist(mtcars$mpg)
par(mar = c(6,5,5,5))
hist(mtcars$mpg)
attach(mtcars)
hist(mpg)
par(mfrow = c(2,2))
par(mfcol = c(2,2))
hist(mpg,main = '1')
par(mfrow = c(2,2))  #multiple frame pe row
hist(mpg,main = '1')
hist(mpg,main = '2')
hist(mpg, main = '3')
hist(mpg, main = '4')
par(mfcol = c(2,2))  #multiple frame pe column
hist(mpg,main = '1')
hist(cycl,main = '2')
hist(cyl,main = '2')
hist(wt,main = '3')
hist(hp,main = '4')
layout(matrix(c(1,1,2,3),byrow = T,nrow = 2))
hist(mpg,main = '1')
hist(cyl,main = '2')
hist(wt,main = '3')
layout(matrix(c(1,1,1,2,3,4),byrow = T,nrow = 2))
hist(mpg, main = '1')
hist(cyl,main = '2')
hist(wt,main = '3')
hist(hp,main = '4')
layout(matrix(c(1,2,3,3,4,5),byrow = T,nrow = 3))
hist(mpg,main = '1')
par('mar')
layout(matrix(c(1,1,2,3),byrow = T,nrow = 2),width=c(3,1),height=c(1,2))  #horizontal prop =3:1,vertical = 1:3
hist(mpg, main = '1')
hist(mtcars$mpg)
hist(cyl,main = '2')
hist(mpg)
hist(wt, main = '3')
hist(hp,main = '4')
layout(matrix(c(1,1,2,3),byrow = T,nrow = 2))


Figures#
par(fig =c(0,0.8,0,0.8),new = T)
plot(wt,mpg)
plot.new()  #
par(fig =c(0,0.8,0,0.8),new = T)
plot(wt,mpg)
boxplot(mtcars$wt,horizontal = T,axes = F)
plot(fig = c(0,0.8,0.55,1),new = T)
plot.new()
?rplot
