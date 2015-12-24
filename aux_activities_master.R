# Submission for the Coursera Johns Hopkins Getting and Cleaning Data class
#
# M.V. Stinger - 2015-12-13
#
# Master list of activities versus indices used in the subject_train,test data
#   files. This file is sourced within the run_analysis.R script to specify the
#   names of activities within the dataset.

# Define activity names and use as levels in tidy data set
activity_list <- read.table(".//UCI HAR Dataset/activity_labels.txt",
                            colClasses=c("integer", "character"),
                            col.names=c("index", "name"))