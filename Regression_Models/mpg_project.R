# This is for Regression Models course project.
# dig the mtcars datasets, and answer the following two questions.
# “Is an automatic or manual transmission better for MPG”.
# "Quantify the MPG difference between automatic and manual transmissions".

# load library and data
library(ggplot2)
data(mtcars)
head(mtcars)

# boxplot 
ggplot(mtcars, aes(as.factor(am),mpg))+geom_boxplot()

# regression
df1 <- mtcars[mtcars$am==1,]
df2 <- mtcars[mtcars$am==0,]
dim(df1)
dim(df2)

ind <- sample(1:nrow(df2), nrow(df1))
df2 <- df2[ind,]

fit1 <- lm(mpg~.-am, data=df1)
fit2 <- lm(mpg~.-am, data=df2)
summary(fit1)
summary(fit2)

# t-test
t.test(fit1$fitted.values,fit2$fitted.values)

mean(fit1$fitted.values-fit2$fitted.values)


