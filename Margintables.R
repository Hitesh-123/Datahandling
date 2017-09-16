# Margin Tables

parties1 = c('bjp','congress','sp','aap')
parties1
length(parties1)
states1 = c('up','delhi','haryana','punjab','uk')
length(states1)
set.seed(1234)
ceiling(runif(20,25,50))
mp = ceiling(runif(20,25,50))
mp
df = data.frame(parties1,states1,mp)
df
df = data.frame(c(rep(parties1,each=5)),c(rep(states1,times=4)),mp)
df
colnames(df) = c('Parties','States','MPs')
table(df)  # not relevant here
ftable(df)
tabulate(df$Parties)  # one column factor type

# table(df)
table(df$Parties)
table(df$States)
table(df[,c("Parties","States")])
table(df[,c("Parties","States")],dnn = list('Political Parties','States of India'))
xtabs(MPs ~ States + Parties,data = df) # formula method
xtabs(MPs ~ Parties + States,data = df) # formula method
statesel = c('up','delhi')  # vector od state names(few)
states1
xtabs(MPs ~ Parties + States,data = df,subset = States %in% statesel)
# state %in% statesel
xtabs(MPs~Parties + States, data = df,subset = States %in% statesel,drop.unused.levels = TRUE)
partiesel = c('aap','bjp')
partiesel
xtabs(MPs~Parties + States,data = df,subset = Parties %in% partiesel,drop.unused.levels = TRUE)
xtabs(MPs~Parties + States, data = df,subset = States %in% statesel & Parties %in% partiesel,drop.unused.levels = TRUE)
ftable(df)
ftable(df$States,df$Parties,df$MPs)

# Margins ------
matresults = xtabs(MPs~Parties + States,data = df)
matresults
str(matresults)
margin.table(matresults,margin = NULL)  # total MPs
margin.table(matresults,margin = 1)
margin.table(matresults,margin = 2)
margin.table(matresults,margin = 3) # error here
# Prop Table ----
prop.table(matresults,margin = NULL)
round(prop.table(matresults,margin = NULL),2)
sum(round(prop.table(matresults,margin = NULL),2)) # proportion of total
p1 = round(prop.table(matresults,margin = 1),2)
p1
rowSums(p1)
barplot(p1)
addmargins(p1,2,sum)
addmargins(p1,1,sum)
(p2 = round(prop.table(matresults,margin = 2),2))

# proportion of total col
rowSums(p2)
colSums(p2)
addmargins(p2,1,sum)
p2
line
load(file = './data/du3.Rdata')
rm(list = ls())
load(file = './data/data/hitesh.RDS')
readRDS(file = './data/Hitesh.RDS')
