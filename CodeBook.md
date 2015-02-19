## CodeBook.MD for run_analysis.R
This **CodeBook** file contains details of the run.analysis.R script

###DataSet
The dataset can be found in the following location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Excerpt of the README.txt file , provided by the original publication [1] 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed **six activities** (**WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING**) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers 
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then 
sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 


###Overview Datafiles 

|  Filename|  Info|
|-------------:|------------:|
|features.txt|List of all features|
|activity_labels.txt|Links the class labels with their activity name|
|train/X_train.txt|List of all trainingsets|
|train/y_train.txt|List of all Training labels|
|test/X_test.txt|List of all testsets|
|test/y_test.txt|List of all Test labels||
|train/subject_train.txt|List of Subject IDs|
|train/subject_test.txt|List of Subject IDs|

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
###Extracts only the measurements on the mean and standard deviation for each assignment.
* Convert all_data from data.frame to data.table, else the select function will generate an error.
* Create a new data table , but select only columns containing "mean" and "std"

##Part3
###Use descriptive activity names to name the activities in the data set.

##Part4
###Appropriately labels the data set with descriptive variable names
* Rename the V1 column to a more appropriate name **Volunteer**
* Remove the first column (Act), became obsolete after the merge.
* Re-order the column order
* Order by Volunteer and activity
* Check for NA's 
##Part5
###Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Use the Reshape2 (optional to narrow the dataset)
* Clean the environment > remove unneeded objects

###Final result => Narrow data, 4 columns, 15480 observations(should be divisible by 180) 
Write the result to a txt file to upload it to Coursera



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors 
or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

