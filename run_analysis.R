# run_analysis.R
# Submission for the Coursera Johns Hopkins Getting and Cleaning Data class
#
# M.V. Stinger - 2015-12-13
#
# This script:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
#     measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.


rm(list=ls())

##  LOAD RAW DATA ###############################################################
# Unzip data if necessary
if(file.exists(".//UCI HAR Dataset")) {
  dir_info <- file.info(".//UCI HAR Dataset")
  message(sprintf("[LOAD] Using existing data directory dated %s", as.Date(dir_info$ctime)))
} else {
  message("[LOAD] Data directory not found, extracting zip file")
  unzip(".//getdata_projectfiles_UCI HAR Dataset.zip")
}

# Capture column names from external master list of indices and names
source(".//aux_columns_master.R")
# Capture activity indices
source(".//aux_activities_master.R")

#   Load raw (training) source data ---------------------------------------------
#     Get file info
file_info <- file.info(".//UCI HAR Dataset//train//subject_train.txt")
message(paste("[LOAD] Loading training source data dated", as.Date(file_info$ctime)))
#     Read participant idx file .................................................
participant_indices <- read.table(".//UCI HAR Dataset//train//subject_train.txt",
                                  nrow=7352,
                                  sep=" ",
                                  header=FALSE,
                                  colClasses=c("numeric"),
                                  col.names=c("participant_idx"))
#     Read activity idx file .................................................
activity_indices <- read.table(".//UCI HAR Dataset//train//y_train.txt",
                               nrow=7352,
                               sep=" ",
                               header=FALSE,
                               colClasses=c("integer"),
                               col.names=c("activty_idx"))
#     Read feature data .........................................................
aux_file_conn <- file(".//UCI HAR Dataset//train//X_train.txt")
raw_training_data <- read.table(aux_file_conn,
                                nrow=7352,
                                header=FALSE,
                                col.names=column_list[,"name"])

#     Remove ignored columns  ...................................................
raw_training_data <- raw_training_data[,column_list[,"keep"]]
#     Insert participant index into feature data  ...............................
raw_training_data[,"participant_idx"] <- participant_indices[,1]
#     Insert activity index into feature data and factorize
raw_training_data[,"activity_idx"] <- activity_indices[,1]
raw_training_data[,"activity"] <- factor(raw_training_data[,"activity_idx"], labels=activity_list[,"name"])
raw_training_data[,"participant"] <- factor(raw_training_data[,"participant_idx"])
#     Remove activity and participant indexes
raw_training_data[,"activity_idx"] <- NULL
raw_training_data[,"participant_idx"] <- NULL




#   Load raw (test) source data -------------------------------------------------
file_info <- file.info(".//UCI HAR Dataset//test//subject_test.txt")
message(paste("[LOAD] Loading test source data dated", as.Date(file_info$ctime)))
#     Read participant idx file .................................................
participant_indices <- read.table(".//UCI HAR Dataset//test//subject_test.txt",
                                  nrow=2947,
                                  sep=" ",
                                  header=FALSE,
                                  colClasses=c("numeric"),
                                  col.names=c("participant_idx"))
#     Read activity idx file .................................................
activity_indices <- read.table(".//UCI HAR Dataset//test//y_test.txt",
                               nrow=2947,
                               sep=" ",
                               header=FALSE,
                               colClasses=c("integer"),
                               col.names=c("activty_idx"))
#     Read feature data .........................................................
aux_file_conn <- file(".//UCI HAR Dataset//test//X_test.txt")
raw_testing_data <- read.table(aux_file_conn,
                                nrow=2947,
                                header=FALSE,
                                col.names=column_list[,"name"])
#close(aux_file_conn)
#     Remove ignored columns  ...................................................
raw_testing_data <- raw_testing_data[,column_list[,"keep"]]
#     Insert participant index into feature data  ...............................
raw_testing_data[,"participant_idx"] <- participant_indices[,1]
#     Insert activity index into feature data and factorize
raw_testing_data[,"activity_idx"] <- activity_indices[,1]
raw_testing_data[,"activity"] <- factor(raw_testing_data[,"activity_idx"], labels=activity_list[,"name"])
raw_testing_data[,"participant"] <- factor(raw_testing_data[,"participant_idx"])
#     Remove activity and participant indexes
raw_testing_data[,"activity_idx"] <- NULL
raw_testing_data[,"participant_idx"] <- NULL


# Run row count test
test_row_count <- nrow(raw_training_data)+nrow(raw_testing_data)
if(test_row_count!=10299)
  warning(paste("Incorrect number of rows:", test_row_count))


##  CONCATENATE TRAINING AND TEST DATA SETS
message("[RBIND] Concatenating training and test data sets")
tidy_data_set <- rbind(raw_training_data, raw_testing_data)

message("[CLEAN-UP] Deleting auxilliary data sets")
raw_training_data <- NULL
raw_testing_data <- NULL



##  REDUCE DATA SET TO MEAN AND STDDEV BY PARTICIPANT AND ACTIVITY
message("[MEAN] Aggregating mean of data")
agg_data <- aggregate(tidy_data_set[,1:79],
                    by=list(Activity=tidy_data_set$activity, Participant=tidy_data_set$participant),
                    FUN=mean)


##  OUTPUT DATASET AS TEXT FILE
message("[OUTPUT] Writing tidy dataset out to .txt file")
write.table(agg_data,
            file="GCD_Proj1_Tidy.txt",
            row.names=FALSE)