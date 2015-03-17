## Import libraries
library(plyr)
library(dplyr)

## Download data and unzip it
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/UCI_HAR_Dataset.zip", method = "curl")
unzip("./data/UCI_HAR_Dataset.zip", exdir = "./data")

## Read files
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")

## Add variable names to the data
volunteer <- c("Subject")
activities <- c("Activities")
featuresName <- features[[2]]
colnames(subject_test) <- volunteer
colnames(X_test) <- featuresName
colnames(y_test) <- activities
colnames(subject_train) <- volunteer
colnames(X_train) <- featuresName
colnames(y_train) <- activities

## Combine the subject, actities and features measurement together in test and train data
## Merge the training and the test sets to create one data set
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
all <- rbind(test, train)

## Extract only the measurements on the mean and standard deviation for each measurement
allMeanStd_pre <- all[, grep("mean|std", colnames(all))]
allMeanStd_pre1 <- allMeanStd_pre[, -grep("meanFreq", colnames(allMeanStd_pre))]

## Use descriptive activity names to name the activities in the data set
Activities <- mapvalues(all$Activities, from = c(1, 2, 3, 4, 5, 6), to=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING"))
allMeanStd <- cbind(Subject=all$Subject, Activities, allMeanStd_pre1)

## Extrac the average of each variable for each activity and each subject
aggrData <- aggregate(. ~ Subject + Activities, data = allMeanStd, mean)
colnames(aggrData)[-c(1:2)] <- paste(colnames(aggrData)[-c(1:2)], "_mean", sep="")

## Save the tidy data into a txt file
write.table(aggrData, file="./data/UCI HAR Dataset/tidydata.txt", row.name=FALSE)
