library(dplyr)
library(reshape2)

#setwd("C:\\Users\\USERNAME\\Dropbox\\School\\Coursera\\Get-Data\\CourseProject\\UCI HAR Dataset")

#Read data to specific data frames matching each file

#First file includes column index for the primary data tables
features = read.table(".\\features.txt",colClasses = "character", col.names = c("feature_id","feature_name"))
#second file includes lookup table for activity types
activities = read.table(".\\activity_labels.txt",colClasses = "character", col.names = c("activity_id", "activity_name"))

#Test data set
subjectTest = read.table(".\\test\\subject_test.txt", col.names = "subject_id")
xTest = read.table(".\\test\\X_test.txt", col.names = features$feature_name) #use  names from the features file to set column names on initial load
yTest = read.table(".\\test\\Y_test.txt", col.names = "activity_id") #Set this columnname to match the field in the lookup table that it will be joined with

#Training data set
subjectTrain = read.table(".\\Train\\subject_train.txt", col.names = "subject_id")
xTrain = read.table(".\\Train\\X_Train.txt", col.names = features$feature_name) #use  names from the features file to set column names on initial load
yTrain = read.table(".\\Train\\Y_Train.txt", col.names = "activity_id") #Set this columnname to match the field in the lookup table that it will be joined with

#Step 1 - Merge the data sets

y = rbind(yTest, yTrain)
x = rbind(xTest, xTrain)
subject = rbind(subjectTest, subjectTrain)

#Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
#     - use grep to find the column positions of variables that contain the designators for mean and standard deviation
#     - then use this vector to trim the dataset to just the desired columns
#     - Note, this does not have to be sorted, but doing so preserves the original column order
columns_to_keep <- c(grep("mean", features$feature_name),grep("std", features$feature_name))
columns_to_keep <- sort(columns_to_keep)
x.trimed <-(x[columns_to_keep])

#Step3 - Uses descriptive activity names to name the activities in the data set
#Merge the Activity Labels to the dataset using the activity_id field
projectData <- cbind (x.trimed, subject, y)
projectData <- (merge(projectData, activities, by.x="activity_id", by.y = "activity_id"))
projectData <- projectData[2:length(names(projectData))]  # Remove the "activity_id" column that is no longer needed




#Step4 - Appropriately labels the data set with descriptive variable names.
#Completed during data load from file using the col.names parameter


#step5 - From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject
projectData.melt <- melt(projectData,id=c("subject_id","activity_name"))
projectData.g <- group_by(projectData.melt, subject_id, activity_name,variable)
projectData.final <- summarize(projectData.g, average = mean(value))                                               



write.table(projectData.final, file=".\\projectData.txt", row.name=FALSE)
                         
                         
                         
                      

