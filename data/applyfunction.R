# Apply function

x = array(1:24,c(4,3,2),dimnames = list(c('c1','c2','c3','c4'),c('d1','d2','d3'),c('s1','s2')))
x
m1 = matrix(c(10:1,rep(5,10),rep(c(5,6),5),seq_len(length.out = 10)), byrow = F, ncol = 4)
colnames(m1) = c('sub1','sub2','sub3','sub4')
rownames(m1) = paste('R',1:10,sep = '')
m1

# Data Frame ----
(df1 = data.frame(sub1 = 10:1, sub2 = 5, sub3 = rep(c(5,6),5), sub4 = seq_len(length.out = 10)))
data.frame(sub1=c(1:10))

# List ----
(list1 = list(sub1 = 10:1, sub2 = rep(5,3), sub3 = rep(c(5,6),5), sub4 = seq_len(length.out = 10)))

# array
X = x
X
apply(X,1,sum)  # dimension = 1 : c
apply(X,1,mean) # dimension = 1 : c
apply(X,2,sum)  # d
apply(X, 3, sum) # s
apply(X,c(1,2),sum)  # c & d
apply(X,c(1,2,3),sum) # original : c d
apply(X,c(2,3),sum)  # sum over 2 & 3rd d dim : d & s

class(apply(X,1,sum))  # Integer Vector
addmargins(X,1,sum)  # row margin = 1
addmargins(X,2,sum) # column margin = 1
addmargins(X,3,sum) # sum s1 + sum s2
addmargins(X,c(1,2),sum)  # row & col
addmargins(X,c(1,3),sum)  # sum rows of 
addmargins(X,c(2,3),sum)  # sum cols of
class(X)
m1
 (m2 = matrix(1:12,nrow = 3))
addmargins(m1,c(1,2),FUN = list(list(sum,sd),list(mean,var)))
addmargins(m2,c(1,2),FUN = list(list(sum,sd),list(mean,var,IQR,sum)))
