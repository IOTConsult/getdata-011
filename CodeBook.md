## CodeBook.MD for run_analysis.R
This **CodeBook** file contains details of the **run.analysis.R** script

###DataSet
The dataset can be found in the following location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Excerpt of the README.txt file , provided by the original publication **[1]**.
 
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

###Used Packages
**data.table** for the **merge** function
**dplyr** for the **select** function 
**plyr** for the **ddply** function
**reshape2** for the **melt** function

###Set Working dir
Put the dataset and R script in the same directory.
###Part1: Merges the training and the test sets to create one data set
* Import the activity labels and features txt files in a data.frame, **act_lab**(6 obs,2 var) and **feat**(561 obs,2 var)
* Convert the Activities column in the **act_lab** dataframe to a character set instead of a factor
* Read all test data in three different dataframes, called **subject_test_data**(2947 obs,1 var),**x_test_data**(2947 obs,561 var) and **y_test_data**(2947 obs,1 var)
* Read all train data in three different dataframes, called **subject_train_data**(7352 obs,1 var),**x_train_data**(7352 obs,561 var) and **y_train_data**(7352 obs,1 var)
* Combine all tables in one large table. 
* Add the second column of the features dataframe as column names on **x_test_data**.
* Do the same for **x_train_data**
* Bind **subject_test_data**, **y_test_data** and **x_test_data**, put it in a dataframe named **test_data**(2947 obs,563 var)
* Bind **subject_train_data**, **y_train_data** and **x_train_data**, put it in a dataframe named **train_data**(7352 obs,563 var)
* Combine the test and train dataframes, put it in a dataframe named **all_data**(10299 obs,563 var)

###Part2: Extracts only the measurements on the mean and standard deviation for each assignment.
* Convert the **all_data** dataframe to a **data.table**.
* Create a new data table, all_data_table(10299 obs,88 var) , but select only observations where the columns containing **"mean"** and **"std"**

###Part3: Use descriptive activity names to name the activities in the data set.
* Add an index key (Act) to the data table, this is needed for the merge function
* Create a new data table as a result of the combination of **act_lab** and **all_data_table**
* The new data table is called: **all_data_act_name**(10299 obs,88 var). All 'names' activities are merged in the data table.

###Part4: Appropriately labels the data set with descriptive variable names
* Rename the V1 column to a more appropriate name **Volunteer**
* Rename the V2 column to a more appropriate name **Activity**
* Remove the first column (Act), became obsolete after the merge.
* Re-order the column order,order by Volunteer and activity
* Check for NA's (No NA vales should be present)
* Create a new data table with the above result, **data_4** (10299 obs,88 var)

###Part5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Use the Reshape2 package (melt function) to narrow the dataset (4 variables), the result is assigned to data table **data_5**(885714 obs,4 var)
* Use the ddply function to summarise by 'mean' for all variables, grouped by Activity and Volunteer, store this in the **final_5**(15480 obs,4 var) data table
* Clean the environment > remove unneeded objects

###Final result => Narrow data, 4 columns, 15480 observations(should be divisible by 180) 





[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors 
or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

