# cast and melt
rollno = rep(c(10:13),4)
rollno
sname = rep(c('Achal','Apoorva','Goldie','Hitesh'),4)
sname
examunit =rep(c('u1','u2','u3','u4'),each=4)
examunit
set.seed(1234)
rpgm = ceiling(rnorm(16,60,10))
rpgm
sql = ceiling(rnorm(16,65,10))
sql
df1 = data.frame(rollno,sname,examunit,rpgm,sql)
df1   # 16 rows, 4 students, 4 units, 2 subjects(cols)

# Melt the data : wide to Long (more rows)


md = reshape2::melt(df1, id=c('rollno','sname','examunit'))
md
head(md)
summary(md)
md[md$rollno]

# without aggregation ----
reshape2::dcast(md, rollno + sname ~ variable)
reshape2::dcast(md,rollno + sname + variable ~ examunit)
reshape2::acast(md,rollno + sname ~ variable ~ examunit)


# Better way to do it
md2 = reshape2::melt(df1,id.vars = c('rollno','sname','examunit'))
md2