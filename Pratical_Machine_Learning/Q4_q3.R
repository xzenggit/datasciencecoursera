#Load the concrete data with the commands:
set.seed(3523)
library(AppliedPredictiveModeling)
library(elasticnet)
library(caret)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

# Set the seed to 233 and fit a lasso model to predict Compressive Strength.
set.seed(233)
fit <- train(CompressiveStrength~., data=training, method="lasso")
plot.enet(fit$finalModel,xvar="penalty")

