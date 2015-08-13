# This is for Quizz 3 Question 5 in Practical Machine Learning Coursera Course
# Author: X. Zeng.

# load library & data
library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test) 

# set y to be a factor variable
vowel.train$y=factor(vowel.train$y)
vowel.test$y=factor(vowel.test$y)

# train model & print variable importance
set.seed(33833)
modFit <- train(y~.,method="rf",data=vowel.train, importance=TRUE, prox=TRUE)
varImp(modFit)






