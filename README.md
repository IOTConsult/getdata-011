## README.MD for run_analysis.R
This **README** file contains an overview of the **Project Course: Getting and Cleaning Data Assignment**

###Download the dataset and create run_analysis.R
The dataset can be found in the following location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Put the dataset and the R script **run_analysis.R** in the same directory.

Run the scipt with the following command **source("run_analysis.R")**

### The R-Script executes the following steps in the correct order
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each assignment.
* Use descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###The final result is a narrow data set, which contains 4 columns and 15480 observations.
It can also be found in the repository, look for **final.txt** 

A Codebook **(CodeBook.md)** is also generated and describes the above steps more in detail.
