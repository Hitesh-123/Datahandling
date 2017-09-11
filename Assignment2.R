v = c(7,12,28,3,41)  #create the data for the chart
png(file = "line_chart.jpg")  #give the chart file a name
plot(v,type = "o")  #plot the bar chart
dev.off() #save the file
plot()
png
library(plotly)
x <- c(1:100)
x
random_y <- rnorm(100, mean = 0)
random_y
data <- data.frame(x, random_y)
data
p <- plot_ly(data, x = ~x, y = ~random_y, type = 'scatter', mode = 'lines')
hist(mtcars$mpg)
sales = read.csv("dailysales.csv",header = TRUE, stringsAsFactors = FALSE)
#creating a line chart
x = c(12,25,3,45,14,23,52)
x
y = c(32,54,14,23,51,14,12)
y
plot(x, type = "o",col = "red",xlab = "Month",ylab = "Rain Fall", main = "Rainfall Chart")
lines(y,type = "o",col = "blue")
