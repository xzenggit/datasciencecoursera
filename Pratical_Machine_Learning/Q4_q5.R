set.seed(3523)
library(AppliedPredictiveModeling)
library(e1071)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

set.seed(325)

# fit a SVM using e1071 package 
fit <- svm(CompressiveStrength~., data=training)

pred <- predict(fit, testing)

RMSE(testing$CompressiveStrength,pred)



