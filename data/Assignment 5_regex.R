# Metacharacters
sub(pattern = "\\.",replacement = "",x='Peace.Love')#gives 'Peacelove'-\\escapes metacharacters
sub(pattern = "\\?",replacement = "Y",x="money?train")#gives 'moneyYtrain'
sub(pattern = '\\{',replacement = "t",x='raspy{voice}')#gives "raspytvoice}"
sub(pattern = '\\|',replacement = 'w',x='tweeter|people')#gives "tweeterwpeople"
#Sequences
sub(pattern = '\\d',replacement = '?',x = 'what is 2067?')#gives "what is ?067?"
gsub(pattern = '\\d',replacement = '@',x='your no. is 23939')#gives "your no. is @@@@@"
sub('\\D','',x='what is your name?')#"hat is your name?"-replaces first non-digit with ''
gsub('\\D','',x='what is your name?23545')# "23545"-replaces all non-digits with ''
sub('\\s','',x='what is the factor?')#"whatis the factor?"-replaces first space
gsub('\\s','',x='what is the factor?')#"whatisthefactor?"-replaces all spaces
sub('\\S','-',x='who is yer father?')#"-ho is yer father?"-replaces first non-space
gsub('\\S','-',x='who is yer father?')#"--- -- --- -------"-replaces all non-spaces
sub('\\b','-',x='what not is this?')#"-what not is this?"
gsub('\\b','-',x='what not is this?')# "-w-h-a-t- -n-o-t- -i-s- -t-h-i-s-?-"
#regex character classes
grep(pattern="[ao]",c('what','is','oats?'),value=T)#"what"  "oats?"
grep(pattern="[0-9]",c('213','aser','2ws1'),value = T)#"213"  "2ws1"
grep(pattern = '[a-z]',c('2345','quad','4988','gffd'),value = T)#"quad" "gffd"
grep(pattern='[qofg]',c('qwerty','owl','tier','fog'),value=T)#"qwerty" "owl" "fog" 
# POSIX character classes
la_vie = "La vie en #FFC0CB (rose);nnCest la vie! nttres jolie"
gsub(pattern="\\s",replacement = '',la_vie)
gsub(pattern='[[:blank:]]',replacement = '',x=la_vie)#remove space
gsub(pattern = "[[:punct:]]",replacement = 'K',x=la_vie)#remove punctuation
gsub(pattern = '[[:xdigit:]]',replacement = 'W',x=la_vie)
gsub(pattern = '[[:print:]]',replacement='x',x=la_vie)
#quantifiers
p = c('raja','meena','prem','tiara','tarun','kunwar','ajay','vijay')
grep(pattern = 'm?',p,value = T)#'m?' means 0 or 1 occurrences of m
grep(pattern = 'm{1}',p,value = T)# 'm{1}' means exactly 1 occurrence of m - grep for matching pattern within text p. 
grep(pattern = 'r{1}',p,value = T)
grep(pattern = 'r*',p,value = T)# 'r*' means 0 or more occurrences of r
grep(pattern = 'r*m',p,value = T)# 'r*m' means 0 or more occurences of r containing m  
grep(pattern = 'm*r',p,value = T)
grep(pattern = 'e{2}',p,value = T)
grep(pattern = 'e*t',p,value = T)
grep(pattern = 'a{2}',p,value = T)
# functions
grep(pattern = 'what',c('what','is','what','for','what'))#gives indices of matched elements with value=F(default)
grep(pattern = 'what',c('what','is','what','for','what'),value = T)#gives matched elements 
grep(pattern = 'what',c('what','is','what','for','what'),invert = T)#gives indices of unmatched elements
grep(pattern = 'what',c('what','is','what','for','what'),invert = T,value=T)#gives unmatched elements
grepl(pattern = 'what',c('what','is','what','for','what'))#TRUE FALSE  TRUE FALSE  TRUE
regexpr(pattern = 'a',c('who is what','is','is what','for','what is that'))#10 -1  6 -1  3
regexpr(pattern = 'av',c('who is what','is','is what','for','what is that'))#-1 -1 -1 -1 -1
regexpr(pattern = 'is',c('who is what','is','is what','for','what is that'))
regexpr(pattern = 'at',c('who is what','is','is what','for','what is that'))#10 -1  6 -1  3
regexpr(pattern = 'ha','who is what for what is that')#9
gregexpr(pattern = 'at',c('who is what','is','is what','for','what is that'))[[5]]#3 11
gregexpr(pattern = 'at',c('who is what','is','is what','for','what is that'))[[1]]#10
gregexpr(pattern = 'at',c('who is what','is','is what','for','what is that'))[[2]]#-1
regexec(pattern = 'at',c('who is what','is','is what','for','what is that'))[[1]]#10 regexec same as gregexpr
x <- regexpr(pattern = 'st','what is the mystery of mysterious mist?')
x
substr('what is the mystery of mysterious mist?',x,x+attr(x,"match.length")-1)
y <- regexpr(pattern = 's',c('who is what','is','is what','for','what is that'))
y
substr(c('who is what','is','is what','for','what is that'),y,y+attr(y,'match.length')-1)#"s" "s" "s" ""  "s"
sub(pattern = 'st','RR','what is the mystery of mysterious mist?')#"what is the myRRery of mysterious mist?"
sub(pattern = 'at','SS',c('who is what','is','is what','for','what is that')) "who is whSS" "is" "is whSS" "for" "whSS is that"
gsub(pattern = 'st','RR','what is the mystery of mysterious mist?')#"what is the myRRery of myRRerious miRR?"
strsplit('what is the mystery of mysterious mist?',' ')#splits text on pattern
tels = c("510-548-2238", "707-231-2440", "650-752-1300")
strsplit(tels,'-')
u1 <- c('tree','trunk','pot','vase')
library(stringr)
str_detect(u1,'tr')#TRUE  TRUE FALSE FALSE
u1[str_detect(u1,'tr')]#"tree"  "trunk"
strings = c("12 Jun 2002", " 8 September 2004 ", "22-July-2009 ",
            "01 01 2001", "date", "02.06.2000",
            "xxx-yyy-zzzz", "$2,600")
p = '([0-9]{1,2})[- .]([a-zA-Z]+)[- .]([0-9]{4})'
str_detect(strings,p)#detects all matches - logical output
str_detect(u1,'e')# TRUE FALSE FALSE  TRUE
mao <- 'what is #hashtag without #hashtag and with #hashtag or #history?'
tw <- '#[a-zA-Z]{1,}'
str_extract(mao,tw)# "#hashtag"
str_extract_all(mao,tw)# "#hashtag" "#hashtag" "#hashtag" "#history"
m1 <- c('what is #hastag?','who does #tweeting','why do #ringing','why #what #how')
str_extract(m1,tw)#"#hastag"   "#tweeting" "#ringing"  "#what"
str_match(strings,p)
str_match_all(mao,tw)#output is character matrix
str_match_all(m1,tw)
str_locate(m1,tw)
str_locate_all(m1,tw)
str_replace('text is written word written on paper','tt','UU')#"text is wriUUen word written on paper"
str_replace(m1,'ha','ps')# "wpst is #hastag?"   "who does #tweeting" "why do #ringing"    "why #wpst #how"
str_replace_all('text is written word written on paper','tt','UU')#"text is wriUUen word wriUUen on paper"
cities = c("San Francisco", "Barcelona", "Naples", "Paris")
str_replace(cities, "[aeiou]", ";")#"S;n Francisco" "B;rcelona"  "N;ples"  "P;ris"
str_replace(cities, "[^aeiou]", ";")#";an Francisco" ";arcelona"  ";aples"   ";aris" 
str_replace_all(cities, "[aeiou]", ";")#"S;n Fr;nc;sc;" "B;rc;l;n;"   "N;pl;s"  "P;r;s"
str_split('what is the mystery of mysterious mist?','m')#"what is the " "ystery of " "ysterious " "ist?"
flavors = c("chocolate", "vanilla", "cinnamon", "mint", "lemon")
str_split(flavors,'[aeiou]',n=2)#splits each element into 2 pieces
str_split_fixed(flavors,'n',n=5)
