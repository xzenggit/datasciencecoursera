# This is for Quizz 3 Question 4 in Practical Machine Learning Coursera Course
# Author: X. Zeng.

# load library & data
library(ElemStatLearn)
library(caret)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

# train model
set.seed(13234)
modFit <- train(chd~age+alcohol+obesity+tobacco+typea+ldl, method="glm", family="binomial", data=trainSA)

# calculate misclassification rate
missClass = function(values,prediction){sum(((prediction > 0.5)*1) != values)/length(values)}
predTrain <- predict(modFit, trainSA)
predTest <- predict(modFit, testSA)
missClass(trainSA$chd, predTrain)
missClass(testSA$chd, predTest)



