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
* Verify them with the View function. For example View(x_train_data)
* Combine all tables in one large table. 
* First of all add the features table (only column2) as column names on x_test_data.
* Verify if the result is as expected
head(x_test_data)
*Do the same for x_train_data
*Use cbind to merge subject_test_data, y_test_data (2nd column) and x_test_data, put all in the table named test_data
*rename the 2nd column to 'Act' to avoid duplicate columnnames
*Use cbind to merge subject_test_data, y_test_data (2nd column) and x_test_data, put all in the table named test_data
*Combine the test and train values
##Part1_End

##Part2_Start
##EXtracts only the measurements on the mean and standard deviation for each assignment.
##Install dplyr   install.packages("dplyr")

##Convert all_data from data.frame to data.table, else the select function will generate an error.

##Create a new data table , but select only columns containing "mean" and "std". add ingore.case = TRUE

##Part2_End

##Part3_Start
##Use descriptive activity names to name the activities in the data set.

##part3_End


##Part4_Start
##Appropriately labels the data set with descriptive variable names
##rename the V1 column to a more appropriate name : Volunteer


## Remove the first column (Act), became obsolete after the merge.

##Re-order the column order


##Order by Volunteer and activity

##Check for NA's (should be 0)
sum(is.na(data_4))
##Part4_end (all observations are completed(no NA's), correctly ordered, )

##Part5_Start
##creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##We will use the plyr and reshape package 

##Use the Reshape2 (optional to narrow the dataset)

##Final check to verify if NA exists.
#sum(is.na(final_5))
##Clean the environment :-) => remove unneeded objects

##Part5_End 
##Final result => Narrow data, 4 columns, 15480 observations(should be divisible by 180) 
##=> Check = OK <- (nrow(final_5)/180): 86
##Write the result to a txt file to upload it to Coursera

