# Data handling on Student data

# Read File----
df1 = read.csv(file = './data/dssstudents.csv')
df1a = read.csv(file = file.chosse())
str(df1)
names(df1)
# start from here ------
colcls =c('numeric',NA,'factor','factor','logical','character','numeric','character','character','character',rep('numeric',4))