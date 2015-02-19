## README.MD for run_analysis.R
This **README** file contains an overview of all important steps for the 
Project Course Getting and Cleaning Data Assignment

###Set Working dir
Put the dataset and R script in the same directory.
##Part1
###Merges the training and the test sets to create one data set
* Import the activity labels and features txt files in a data.frame, **act_lab** and **feat**
* Convert the Activities column in the **act_lab** dataframe to a character set instead of a factor
* Read all test data in three different dataframes, called **subject_test_data**,**x_test_data** and **y_test_data**
* Read all train data in three different dataframes, called **subject_train_data**,**x_train_data** and **y_train_data**
* Combine all tables in one large table. 
* Add the second column of the features dataframe as column names on x_test_data.
* Do the same for x_train_data
* Bind **subject_test_data**, **y_test_data** and **x_test_data**, put it in a dataframe named **test_data**
* Combine the test and train dataframes, put it in a dataframe named **all_data**

##Part2
###EXtracts only the measurements on the mean and standard deviation for each assignment.
* Convert all_data from data.frame to data.table, else the select function will generate an error.
* Create a new data table , but select only columns containing "mean" and "std". add ingore.case = TRUE

##Part3
*Use descriptive activity names to name the activities in the data set.

##Part4
###Appropriately labels the data set with descriptive variable names
* Rename the V1 column to a more appropriate name **Volunteer**
* Remove the first column (Act), became obsolete after the merge.
* Re-order the column order
* Order by Volunteer and activity
* Check for NA's (should be 0)
##Part5
###Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Use the Reshape2 (optional to narrow the dataset)
* Clean the environment > remove unneeded objects

###Final result => Narrow data, 4 columns, 15480 observations(should be divisible by 180) 
###Write the result to a txt file to upload it to Coursera
