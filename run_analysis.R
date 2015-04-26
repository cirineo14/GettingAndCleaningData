## See the README file for explanations on how to use this script.
## See the CodeBook file for description of the variables, the data, and the
## transformations performed to clean up the data. 

library(dplyr)

## Reading in the text files from the training and the test sets.
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

## Question 1
## Creation of a data set through the merging of the previous sets
testDF <- cbind(subject_test, y_test, X_test)
rm(subject_test, y_test, X_test)        # Remove unecessary objects
trainDF <- cbind(subject_train, y_train, X_train)
rm(subject_train, y_train, X_train)
mergedDF <- rbind(testDF, trainDF)
rm(testDF, trainDF)

## Question 2
## Extraction of measurements on the mean and standard deviation.
## Get the indices with mean and std
features <- read.table("UCI HAR Dataset/features.txt")
meanInd <- grep("mean", features$V2)
stdInd <- grep("std", features$V2)
ind <- sort(c(meanInd, stdInd))
## Extraction of the data : subjects + activities + means and std measurements
# The ind vector has to be modified because there are two more columns
tidyDF <- mergedDF[, c(1, 2, 2+ind)]

## Question 3
#Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
tidyDF[,2] <- cut(tidyDF[,2], 6, labels = activity_labels[,2])

## Question 4
# Appropriately labels the data set with descriptive variable names.
colnames(tidyDF) <- c("Subject", "Activity", as.character(features[ind,2]))

## Question 5
# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
X <- tidyDF %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
write.table(X, "TidyDataSet.txt")