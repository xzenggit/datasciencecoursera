library(caret)
library(forecast)
library(quantmod)
library(lubridate)  # For year() function below
dat = read.csv("~/Desktop/work/job/data/coursera/data/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

# fit bats model
fit <- bats(tstrain)

# do predcition
pred <- forecast(fit, level=95, h=dim(testing)[1])

accuracy(pred, testing$visitsTumblr)

# calaulate percentage
num <- testing$visitsTumblr>=pred$lower & testing$visitsTumblr <= pred$upper
sum(num)/length(num)

