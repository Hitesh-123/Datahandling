# Arrays
# 2 coys ; Each coy has 3 depts : Each dept has 4 salesman
company = c('coy1','coy2')
department = c('dept1','dept2','dept3')
salesman = c('salesman1','salesman2','salesman3','salesman4')
set.seed(1234)
sales = ceiling(runif(2*3*4,50,100))
mean(sales)
cat(sales)
sales:lenath(sales)
sales = ceiling(runif(2*3*4,50,100))
mean(sales)
floor(3.2);ceiling(3.2)
sales;length(sales)
?array
array(data = NA,dim = length(data),dimnames = NULL)
salesarray = array(dim=c(4,3,2),data=sales,dimnames=list(salesman,department,company))
salesarray = array(dim = c(4,3,2),data = sales,dimnames = list(salesman,department,company))
salesman = c('salesman1','salesman2','salesman3','salesman4')
salesarray = array(dim=c(4,3,2),data=sales,dimnames=list(salesman,department,company))
salesarray
colnames(salesarray)
rownames(salesarray)

dimnames(salesarray)
dimnames(salesarray)[[3]]
length(salesarray)
nrow(salesarray)
ncol(salesarray)
dim(salesarray)
class(salesarray)
sales[3,2,1]
salesarray[3,2,1] # salesman3, dept2, coy1
salesarray[2,1,1] #salesman2, dept1, coy1
salesarray[1,,] #salesman1 of all dept & copy
salesarray[,,1] #coy1
