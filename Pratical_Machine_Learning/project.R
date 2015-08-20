# This is for Practicale Machine Learning Course Project
# The data for this project come from this source: http://groupware.les.inf.puc-rio.br/har

# load libraries and data
library(caret)
library(glmnet)
library(corrplot)
library(randomForest)
data_train <- read.csv("~/Desktop/work/job/data/coursera/data/pml-training.csv", 
                       na.strings = c("NA", ""))
data_test <- read.csv("~/Desktop/work/job/data/coursera/data/pml-testing.csv",
                      na.strings = c("NA", ""))

# take a look at the data
dim(data_train)
str(data_train)

# get rid of NA columns (NA percentage > 40%)
data_train <- data_train[, colSums(!is.na(data_train)) > nrow(data_train)*0.6]
dim(data_train)
str(data_train)

# now we have less variables, but still a lot.
# we can get rid of some variables that not related to our prediction
data_train <- data_train[,8:ncol(data_train)]
dim(data_train)
str(data_train)

# now the variables are in a reasonable range, but still a lot.
# let's first see if there are some variables highly correlated with each other.
corr_mat <- cor(data_train[,-ncol(data_train)])
corrplot(corr_mat, type="upper", method="circle")

# partion the data into training (70%) and testing sets (30%).
ind_training <- createDataPartition(y=data_train$classe, p=0.7, list=FALSE)
training <- data_train[ind_training,]
testing <- data_train[-ind_training,]

# build the model 
fit <- train(classe~., method="rf", data=training)
pred <- predict(fit, newdata=testing)
confusionMatrix(pred, testing$classe)

# for pml-testing.csv dataset
answers <- predict(fit, newdata=data_test)
confusionMatrix(answers, data_test$classe)
# function for easily generating txt files
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}

pml_write_files(answers)






