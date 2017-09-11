y = matrix(1:20, nrow=5, ncol=4)
y
x = matrix(1:10,nrow = 4)
x = matrix(1:20,nrow = 2)
x
x = matrix(1:20,ncol = 3)
x = matrix(1:20,ncol = 2)
x
x = [2,]
a = x[2,]
a
b = x[,5]
b = x[,2]
b
c = x[1,c(4,5)]
d = x[1,c(4,5)]
dim1 = c('A1','A2')
dim1
dim2 = c('B1','B2','B3')
dim2
dim3 = c('C1','C2','C3','C4')

patient id = c(1,2,3,4)
dim3
z = array(1:24, dimnames = list(dim1,dim2,dim3))
z = array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
z


patientid = c(1,2,3,4)
patientid
age = c(25,28,35,40)
age
diabetes = c('Type1','Type2','Type3','Type4')
diabetes
status = c("Excellent","Poor","Normal","Very Bad")
status
patientdata = data.frame(patientid,age,diabetes,status)
patientdata
patientdata[1:2]
patientdata[1:3]
patientdata[c('diabetes','status')]
patientdata$age
patientdata$status
table(patientdata$diabetes, patientdata$status)
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)
attach(mtcars)
attach
mpg <- c(25, 36, 47)
mpg
attach(mtcars)
patientID = c(1, 2, 3, 4)
patientID
age = c(25, 34, 28, 52)
age
diabetes <- c("Type1", "Type2", "Type1", "Type1")
diabetes
status = c("Poor", "Improved", "Excellent", "Poor")
status
patientdata = data.frame(patientID,age,diabetes,status)
patientdata
Center = c("Air Force Research Laboratory","Arnold Engineering Development Center","Pacific Northwest National Laboratory")
Status = c("Public")
table = data.frame('Center','Status')
table
table = data.frame(Center,Status)
table
patientdata = data.frame(1:4)
patientdata
table$center
patientdata[c('diabetes,'status)]
patientdata[1:2]
patientdata

table(patientdata$diabetes,patientdata$status)
