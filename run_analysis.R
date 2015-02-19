##Set Working dir
setwd ("\\\\UPLCI084736/USERS$/gjf510/MyCloudDrive/Documents/Coursera/getdata-011/week4")
##Part1_Start
#install.packages("data.table")
library(data.table)
##Merges the training and the test sets to create one data set
##Create tabels for the activity labels and features txt file
act_lab = read.table("UCI HAR Dataset/activity_labels.txt")  # read activity Labels file in a table 
feat = read.table("UCI HAR Dataset/features.txt")  # read features file in a table 
##Convert the second column to a character set instead of a factor
act_lab$V2 <- as.character(act_lab$V2)
##Read all test data
subject_test_data = read.table("UCI HAR Dataset/test/subject_test.txt")  # read subject test data info file in a table 
x_test_data = read.table("UCI HAR Dataset/test/X_test.txt")  # read X test data info file in a table 
y_test_data = read.table("UCI HAR Dataset/test/y_test.txt")  # read y test data info file in a table 
##Read all train data
subject_train_data = read.table("UCI HAR Dataset/train/subject_train.txt")  # read subject train data info file in a table 
x_train_data = read.table("UCI HAR Dataset/train/X_train.txt")  # read X train data info file in a table 
y_train_data = read.table("UCI HAR Dataset/train/y_train.txt")  # read y train data info file in a table 
##Verify them with the View function. For example: View(x_train_data)

##Combine all tables in one large table. 
##First of all add the features table (only column2) as column names on x_test_data.
colnames(x_test_data) <- feat[,2]
##Verify head(x_test_data)
##Do the same for x_train_data
colnames(x_train_data) <- feat[,2]

##Use cbind to merge subject_test_data, y_test_data (2nd column) and x_test_data, put all in the table named test_data
test_data <- cbind(subject_test_data,y_test_data[1],x_test_data)
##rename the 2nd column to 'Act' to avoid duplicate columnnames
colnames(test_data)[2] <- "Act"
##Use cbind to merge subject_test_data, y_test_data (2nd column) and x_test_data, put all in the table named test_data
#train_data <- cbind(subject_train_data,y_train_act_lab[2],x_train_data)
train_data <- cbind(subject_train_data,y_train_data[1],x_train_data)
colnames(train_data)[2] <- "Act"

##Combine the test and train values
all_data <- rbind(test_data,train_data)

##Part1_End

##Part2_Start
##EXtracts only the measurements on the mean and standard deviation for each assignment.
##Install dplyr   install.packages("dplyr")
library(dplyr)
##Convert all_data from data.frame to data.table, else the select function will generate an error.
all_data <- data.table(all_data)
##Create a new data table , but select only columns containing "mean" and "std". add ingore.case = TRUE
#all_data_table <- cbind(select (all_data, contains("V1", ignore.case = TRUE)),select (all_data, contains("V2", ignore.case = TRUE)),select (all_data, matches("mean", ignore.case = TRUE)), select (all_data, matches("std", ignore.case = TRUE)))
all_data_table <- cbind(select (all_data, contains("V1", ignore.case = TRUE)),select (all_data, contains("Act", ignore.case = TRUE)),select (all_data, matches("mean", ignore.case = TRUE)), select (all_data, matches("std", ignore.case = TRUE)))

##Part2_End

##Part3_Start
##Use descriptive activity names to name the activities in the data set.
all_data_table <- data.table(all_data_table)
setkey(all_data_table,Act)
colnames(act_lab) <- c("Act","V2")
act_lab <- data.table(act_lab)
setkey(act_lab,Act)
all_data_act_name <- merge(all_data_table,act_lab)
##part3_End


##Part4_Start
##Appropriately labels the data set with descriptive variable names
##rename the V1 column to a more appropriate name : Volunteer
setnames(all_data_act_name,"V1", "Volunteer")
setnames(all_data_act_name,"V2", "Activity")

## Remove the first column (Act), became obsolete after the merge.
all_data_act_name[, Act:=NULL]
##Re-order the column order
all_data_act_name <- subset(all_data_act_name, select=c(Volunteer,Activity,2:87))

##Order by Volunteer and activity
data_4 <- setorder(all_data_act_name, Volunteer, Activity)
##Check for NA's (should be 0)
sum(is.na(data_4))
##Part4_end (all observations are completed(no NA's), correctly ordered, )

##Part5_Start
##creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##We will use the plyr and reshape package 
library(plyr)
library(reshape2)
##Use the Reshape2 (optional to narrow the dataset)
data_5 <- melt(data_4, id.vars=c("Volunteer","Activity"))
final_5 <- ddply(data_5, c("Volunteer", "Activity", "variable"), summarise, mean = mean(value))
##Final check to verify if NA exists.
#sum(is.na(final_5))
##Clean the environment :-) => remove unneeded objects
rm(list=setdiff(ls(), "final_5"))
##Part5_End 
##Final result => Narrow data, 4 columns, 15480 observations(should be divisible by 180) 
##=> Check = OK <- (nrow(final_5)/180): 86
##Write the result to a txt file to upload it to Coursera
write.table(final_5, file="final.txt", row.names=FALSE)
