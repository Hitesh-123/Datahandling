# Reading Faithful Dataset

# Find the mean eruption duration in the data set faithful
faithful
duration = faithful$eruptions  # the eruption durations
duration
mean(duration)   # apply the mean function
# Find the median of the eruption duration in the data set faithful
median(duration) # apply the median function
# Find the quartiles of the eruption durations in the data set faithful
quantile(duration) # apply the quantile function
# Find the 32nd, 57th and 98th percentiles of the eruption durations in the data set faithful
quantile(duration, c(.32, .57, .98))
# Find the range of the eruption duration in the data set faithful
max(duration)
min(duration)
max(duration) - min(duration) # apply the max and min functions
# Find the interquartile range of eruption duration in the data set faithful
IQR(duration) # apply the IQR function
# Find the standard deviation of the eruption duration in the data set faithful
sd(duration) # apply the standard devation function
# Find the variance of the eruption duration in the data set faithful
var(duration) # apply the variance function
# Find the skewness of eruption duration in the data set faithful
library(e1071)
skewness(duration) # apply the skewness function
# Find the kurtosis of eruption duration in the data set faithful
kurtosis(duration) # apply the kurtosis function
# Find the stem-and-leaf plot of the eruption durations in faithful
stem(duration) # apply the stem-and-leaf plot function
# Find the scatter plot of the eruption durations and waiting intervals in faithful
waiting = faithful$waiting
waiting # the waiting interval
head(cbind(duration, waiting))
plot(duration, waiting, xlab="Eruption duration", ylab="Time waited") # plot the variables
abline(lm(waiting ~ duration)) # draw a trend line with abline
# Find the histogram of the eruption durations in faithful
hist(duration,right=FALSE)  # apply the hist function
# Find the box plot of the eruption duration in the data set faithful
boxplot(duration, horizontal=TRUE)  # horizontal box plot
# Find the covariance of eruption duration and waiting time in the data set faithful.Observe if there is any linear relationship between the two variables
cov(duration,waiting) # apply the cov function
# Find the correlation coefficient of eruption duration and waiting time in the data set faithful.Observe if there is any linear relationship between the variables
cor(duration,waiting) # apply the cor function
# Reading Insectsprays Dataset
InsectSprays
# Find the boxplot for InsectSprays
boxplot(count ~ spray, data = InsectSprays, notch = TRUE, add = TRUE, col = "blue")
boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col = "bisque")
rb <- boxplot(decrease ~ treatment, data = OrchardSprays, col = "bisque")
mn.t <- tapply(OrchardSprays$decrease, OrchardSprays$treatment, mean)
sd.t <- tapply(OrchardSprays$decrease, OrchardSprays$treatment, sd)
xi <- 0.3 + seq(rb$n)
points(xi, mn.t, col = "orange", pch = 18)
arrows(xi, mn.t - sd.t, xi, mn.t + sd.t, code = 3, col = "pink", angle = 75, length = .1)

