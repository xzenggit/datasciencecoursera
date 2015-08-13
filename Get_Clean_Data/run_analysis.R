# This is for the course project of Getting and Cleaning Data in Coursera.
# Author: X. Zeng

# load libraries
library("data.table")
library("dplyr")

# load data
feature_name <- read.table("features.txt")
activity_name <- read.table("activity_labels.txt", header=FALSE)

subject_train <- read.table("train/subject_train.txt", header=FALSE)
activity_train <- read.table("train/y_train.txt", header=FALSE)
features_train <- read.table("train/X_train.txt", header=FALSE)

subject_test <- read.table("test/subject_test.txt", header=FALSE)
activity_test <- read.table("test/y_test.txt", header=FALSE)
features_test <- read.table("test/X_test.txt", header=FALSE)

# 1. Merge test and train data to one set
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(features_train,features_test)

colnames(features) <- t(feature_name[2])
colnames(activity) <- "activity"
colnames(subject)  <- "subject"

data <- cbind(features, activity, subject)

# 2. Extract measurment on mean and std 
col_extract <- grep(".*mean.*|.*std.*", names(data), ignore.case=TRUE)
measure_extract <- data[,col_extract]

# 3. Use descriptive activity names to name the activities in the data
for (i in 1:nrow(activity_name)) {
	data$activity[data$activity==i] <- as.character(activity_name[i,][2])
}
data$activity <-as.factor(data$activity)

# 4. Appropriately labels the data set with descriptive variable names.
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))

# 5.  Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
data$subject <- as.factor(data$subject)
data <- data.table(data)
tidy_data <- aggregate(.~subject+activity, data, FUN=mean, na.rm=TRUE)
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)








 












