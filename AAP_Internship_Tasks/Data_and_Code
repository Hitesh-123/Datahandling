


# loading libraries for data visualization
library(ggplot2)
library(readr)
library(dplyr)
devtools::install_github("dgrtwo/gganimate")
library(gganimate)
library(ggthemes)
library(RColorBrewer)
# Loading the data
data1 = read.csv('./data/01_District_wise_crimes_committed_IPC_2001_2012.csv')
data2 = read.csv('./data/01_District_wise_crimes_committed_IPC_2013.csv')
# Checking the structure of the data
str(data1)
str(data2)
# Merging both the datasets
data = rbind(data1,data2)
str(data)
# Cleaning & Adding
data$st.dt = paste(tolower(data$STATE.UT),"-",tolower(data$DISTRICT)) # creating new col with st-dist name
names(data) = c('st','dis','yr','mur','attmur','homici','rape','cusrape','otrape','kidn','kidgr','kidoth','dac','dacpre','rob','burg','theft','autoth','theftot','riots','breoftru','cheating','counterf','arson','hurt','dowrydea','asswo','inswo','curbyhus','impogrfor','deaneg','othipc','totipc','st.dt') # renameing columns
data[data$dis=='DELHI UT TOTAL',2] = 'TOTAL' # renaming delhi ut total to total
data = data[data$dis!='TOTAL',] # Removing Totals data,as it doubling the figures
data$othipc = NULL # removing other ipc as it's skewing the data
for( i  in 1:nrow(data)) {
  data$totipc[i] = sum(data[i,4:31])
}
# Adding population data 
popu = data.frame(yr=c(2001:2013),popBillion=c(1070000000,1080000000,1100000000,1120000000,1140000000,1160000000,1170000000,1190000000,1210000000,1230000000,1240000000,1260000000,1280000000))
data = merge(data,popu)
# Now Creating Subsets
totby_pop_yr = data %>% select(yr,totipc,popBillion) %>% 
  group_by(yr) %>% 
  summarise(totipc = sum(totipc),pop=mean(popBillion))
totby_pop_yr = totby_pop_yr %>% 
  mutate(perlakh =round((totipc/pop)*100000,0)) # adding per lakh
totby_st_yr = data %>% select(yr,st,totipc,popBillion) %>%  group_by(st,yr) %>%  summarise(totipc=sum(totipc),pop = mean(popBillion))
totby_st = totby_st_yr %>% group_by(st) %>% summarise(totipc=sum(totipc),pop = max(pop))

totby_dis_yr = data %>% select(dis,totipc,yr,st.dt) %>%  group_by(dis,yr,st.dt) %>%  summarise(totipc = sum(totipc))
totby_dis = totby_dis_yr %>% group_by(dis,st.dt) %>% summarise(totipc=sum(totipc))
# Getting into Exploratory Data Analysis
#Crimes Per Year
ggplot(totby_pop_yr) +geom_bar(aes(yr,totipc,fill=yr),stat='identity') + xlab("Year") +ylab("Total Crimes") + ggtitle("Crimes per Year") + guides(fill=FALSE) + theme_wsj()
# Crimes per Lakh person
ggplot(totby_pop_yr) + geom_bar(aes(yr,perlakh,fill=yr),stat='identity') + xlab("Year") +ylab("Per Lakh") + ggtitle("Crimes per Lakh People") + guides(fill=FALSE) + theme_wsj()
# Crimes per State
ggplot(totby_st) + geom_bar(aes(st,totipc,fill=totipc),stat='identity') + xlab("Year") +ylab("Crimes") + ggtitle("Crimes per State") + guides(fill=FALSE) + theme_wsj() + theme(axis.text.x = element_text(angle = 90, hjust = 1))
# Top States
states = totby_st %>% select(st,totipc) %>% arrange(desc(totipc))
head(states,20)
# Crimes per District
ggplot(totby_dis,aes(dis,totipc)) + geom_point(aes(size=totipc,colour=dis,label=dis)) + geom_text(aes(label=ifelse(totipc>200000,as.character(dis),'')),hjust=0.01,vjust=0) + xlab("District") +ylab("Crimes") + ggtitle("Crimes per District") + guides(size=FALSE,colour=FALSE) + theme_wsj() + theme(axis.text.x=element_blank(),axis.line.x = element_blank())
# Crimes per District focused
ggplot(totby_dis[totby_dis$totipc>100000,],aes(dis,totipc)) + geom_point(aes(size=totipc,colour=totipc,label=st.dt)) + geom_text(aes(label=ifelse(totipc>100000,as.character(st.dt),'')),hjust=0.01,vjust=0) + xlab("District") +ylab("Crimes") + ggtitle("Crimes per District")   + guides(size=FALSE,colour=FALSE) + theme_wsj() + theme(axis.text.x=element_blank())
# Top Districts
dist = totby_dis %>% select(dis,totipc) %>% arrange(desc(totipc))
head(dist,20)
