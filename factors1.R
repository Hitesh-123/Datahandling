gender = c('M','F','F','M','F')
g1 = factor(gender,levels = c('F','M'))
months = c('Jan','Feb','March','April')
months
month.abb[1:12]
month.abb[1:6]
months1 = factor(months)
months1
months2 = factor(months,levels=c('Jan','Feb','March,'April'),ordered = T)
months2 = factor(months,levels=c('Jan','Feb','March','April'),ordered = T)
months2
months2 = factor(months,levels=month.abb[1:12],ordered = T)
months2
months2 = factor(months,levels=c('April','Jan'),ordered = T)
months2
month5 = c(months,'xyz')
month5
diabetes = c('Type1','Type2','Type1','Type1')
diabetes
cat(diabetes)
gender = c(1,2,1,1,2) # 1-M,2-F
gender
fdiabetes = factor(diabetes)
class(fdiabetes)
fdiabetes
summary(fdiabetes)
summary(diabetes)
fdiabetes = c(fdiabetes,'Type3')
fdiabetes
class(fdiabetes)
#Add another Level Properly
fdiabetes = factor(fdiabetes,levels = c(levels(fdiabetes),'Type3'))
fdiabetes
levels(fdiabetes)
levels(diabetes) = c(levels(fdiabetes),'Type4')
fdiabetes
levels(fdiabetes)[5] = 'Type5'
fdiabetes
levels(diabetes)
summary(diabetes)
fdiabetes[4] = 'Type3'
fdiabetes[5] = 'Type6'
sum(is.na(fdiabetes))
table(fdiabetes,exclude = NULL)
table(fdiabetes,exclude = NA)
is.na(fdiabetes)
fdiabetes2 = na.omit(fdiabetes)
fdiabetes
gender = c(1,2,1,1,2)
fgender = factor(gender)
fgender
fgender = factor(gender,levels=c(1,2),labels = c('M','F'))
fgender


#ordinal
clsposn = c(1,2,3,1)
class(clsposn)
summary(clsposn)
mode(clsposn)
fclsposn = factor(clsposn)
fclsposn
summary(fclsposn)
levels(fclsposn)
fclsposn2 = factor(clsposn,levels = c(1,2,3,4,5),ordered = T,labels = c('First','Second','Third','Fourth','Fifth'))
fclsposn2
summary(fclsposn2)
levels(fclsposn2)
fclsposn3 = factor(fclsposn2,levels(fclsposn2)[c(5,4,3,2,1)])
fclsposn3
levels(fclsposn2)
levels(fclsposn3)
fclsposn2
fclsposn4 = factor(fclsposn2,levels = rev(levels(fclsposn2)))
fclsposn4
rev(levels(fclsposn2))
status = c('Poor','Improved','Excellent')
fstatus = factor(status)
fstatus
# unordered Factors can be releveled - Making Poor First
fstatus2 = relevel(fstatus,'Poor')
fstatus2
fstatus3 = factor(status,ordered = T,levels = c('Poor','Improved','Excellent'))
fstatus3
summary(fstatus3)
plot(fstatus3)
plot(status)
plot(table(status))
