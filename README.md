# Coursera_Get-And-Clean-Data
Repository for the Coursera class 'Getting and Cleaning Data'
--------------------------------------------------------------------
Location for submitting Course Project
-----------------------
Contains:
README.MD - This file
CodeBook.txt - Description of Variables and transformations used
run_analyis.R - R Script produced for this project
ProjectData.txt - data set produced by the run_analysis.R script.
                - Created using the function write.table(projectData.final, file=".\\projectData.txt", row.name=FALSE)

----------------------------
Sources
Starts with the dataset specified by the project instructions 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

attributed to 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

--------------------------
Assumptions:
Dataset uncompresses to a directory named "UCI HAR Dataset"
Script uses relative file paths that assume running from this directory



