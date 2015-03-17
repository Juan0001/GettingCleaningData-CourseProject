## Getting and Cleaning Data (Coursera) - Course Project

Repository for the course project in Getting and Cleaning Data course provided by Coursera (https://www.coursera.org)

### Team Members
* “Juan Luo”  juanluo2008@gmail.com 

###  Purpose
The purpose of this project is to practice the ability to collect, work with, and clean a data set.
The goal is to prepare a tidy data set that can be used for later analysis.

### Data set
The data set is downloaded from UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/). 

The following is the information of the data set:
	
**Name**: Human Activity Recognition Using Smartphones Data Set

**Source**: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

**Citation**: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
	
### Objectives

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### run_analysis.R

When sourced, the script starts to download the file from source, unzip it and do the data cleaning steps according to the objectives and save the cleaned data to a txt file by the end.

The following are the details of each process steps:

1. It checks if there is a data directory in your working directory. If not, it will create one and download the “UCI HAR Dataset.zip” file under that directory by using _download.file_. Then unzip it into the “UCI HAR Dataset” folder.
2. It reads the files in the “test” and “train” folders into RStudio by using _read.table_. The files imported are subject_test.txt, X_test.txt,  y_test.txt, subject_train.txt, X_test.txt, y_test.txt and features.txt.
3. It labels the variables with descriptive variable name in each txt file. 
4. It puts the subject, activities, and features measurement together by using _cbind_. And  it merges the test and train data together by using _rbind_.
5. It extracts columns contain mean and standard deviation. _grep_ is used to filter the columns.
6. It converts the numbers that represent different activities to descriptive activity names by using _mapvalues_.
7. It extracts the average of each variable for each activity and each subject by using aggregate.
8. Finally, it saves the cleaned tidy data in to a txt file named “tidydata.txt” by using write.table with row.name=FALSE.

