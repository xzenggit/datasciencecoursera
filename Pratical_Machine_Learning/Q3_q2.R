# This is for Quizz 3 Question 2 in Practical Machine Learning Coursera Course
# Author: X. Zeng.

# load libraries
library(AppliedPredictiveModeling)
library(caret)

# load data & set random seed
data(segmentationOriginal)
set.seed(125)

# get the training data & train the model
training <- subset(segmentationOriginal, segmentationOriginal$Case=="Train")
fit <- train(Class~., method="rpart", data=training)

# plot the tree
plot(fit$finalModel)
text(fit$finalModel, use.n=TRUE, all=TRUE)

# print the final model
print(fit$finalModel)





