

library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test) 

set.seed(33833)

# set y as factor
vowel.test$y <- as.factor(vowel.test$y)
vowel.train$y <- as.factor(vowel.train$y)

# Fit a random forest predictor relating the factor varaible
# to the remaining variabels
rf_fit <- train(y~., data=vowel.train, method="rf")
rf_pred <- predict(rf_fit, vowel.test)
rf_ac <- table(rf_pred, vowel.test$y)
sum(diag(rf_ac))/sum(rf_ac)

# a boosted predictor using the "gbm" method.
bt_fit <- train(y~., data=vowel.train, method="gbm")
bt_pred <- predict(bt_fit, vowel.test)
bt_ac <- table(bt_pred, vowel.test$y)
sum(diag(bt_ac))/sum(bt_ac)

# agreement accuracy
sum(pmin(bt_ac,rf_ac))/sum(bt_ac)

