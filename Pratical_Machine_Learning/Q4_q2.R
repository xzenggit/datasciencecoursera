# Load the Alzheimer's data using the following commands
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

# Set the seed to 62433 and predict diagnosis with all the other variables 
# using a random forest ("rf"), boosted trees ("gbm") and linear discriminant 
# analysis ("lda") model. Stack the predictions together using random forests ("rf").
set.seed(62433)

rt_fit <- train(diagnosis~., data=training, method="rf")
gbm_fit <- train(diagnosis~., data=training, method="gbm")
lda_fit <- train(diagnosis~., data=training, method="lda")

# prediction
rt_pred <- predict(rt_fit, newdata=testing)
gbm_pred <- predict(gbm_fit, newdata=testing)
lda_pred <- predict(lda_fit, newdata=testing)

# stack prediction together
stack_df <- data.frame(rt_pred, gbm_pred, lda_pred, diagnosis=testing$diagnosis)
stack_fit <- train(diagnosis~., method="rf", data=stack_df)
stack_pred <- predict(stack_fit, stack_df)

# get the confusion matrix
rf_con <- confusionMatrix(rt_pred, testing$diagnosis)
gbm_con <- confusionMatrix(gbm_pred, testing$diagnosis)
lda_con <- confusionMatrix(lda_pred, testing$diagnosis)
stack_con <- confusionMatrix(stack_pred, testing$diagnosis)

# get accuracry
rf_con$overall[1]
gbm_con$overall[1]
lda_con$overall[1]
stack_con$overall[1]






