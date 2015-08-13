# This is for Quizz 3 Question 3 in Practical Machine Learning Coursera Course
# Author: X. Zeng.

# load library & data
library(pgmm)
library(caret)

data(olive)
olive = olive[,-1]

# seperate training and testing dataset
indTrain <- createDataPartition(y=olive$Area, p=0.7, list=FALSE)
training <- olive[indTrain,]
testing <- olive[-indTrain,]
dim(training)
dim(testing)

# train model
modFit <- train(Area ~.,data=training)

# print model 
print(modFit$finalModel)

# do prediction
newdata = as.data.frame(t(colMeans(olive)))
predict(modFit, newdata=newdata)






