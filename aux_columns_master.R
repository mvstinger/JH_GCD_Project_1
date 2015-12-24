# Submission for the Coursera Johns Hopkins Getting and Cleaning Data class
#
# M.V. Stinger - 2015-12-13
#
# Master list of features vs column names vs indices for features of interest
#   This file is sourced within the run_analysis.R script to specify the names
#   and relative positions of the relevant features within the dataset. The
#   indices and names were pulled from "features.txt" and formatted to fit
#   R naming rules. More specifically, hyphens were replaced by underscores and
#   parentheses were removed. Slightly more complicated changes were made to
#   the "angle(...)" features.

# # Define column names and use to specify which columns to read- ie. NULL for unused columns,
#   character array for used variables.

column_list <- as.data.frame(matrix(data=NA, nrow=561, ncol=2))
colnames(column_list) <- c("name", "keep")

column_list[1, "name"] <-    "time_body_accl_mean_X"
column_list[2, "name"] <-    "time_body_accl_mean_Y"
column_list[3, "name"] <-    "time_body_accl_mean_Z"
column_list[201, "name"] <-  "time_body_accl_mean_M"

column_list[4, "name"] <-    "time_body_accl_std_X"
column_list[5, "name"] <-    "time_body_accl_std_Y"
column_list[6, "name"] <-    "time_body_accl_std_Z"
column_list[202, "name"] <-  "time_body_accl_std_M"

column_list[81, "name"] <-   "time_body_ajrk_mean_X"
column_list[82, "name"] <-   "time_body_ajrk_mean_Y"
column_list[83, "name"] <-   "time_body_ajrk_mean_Z"
column_list[227, "name"] <-  "time_body_ajrk_mean_M"

column_list[84, "name"] <-   "time_body_ajrk_std_X"
column_list[85, "name"] <-   "time_body_ajrk_std_Y"
column_list[86, "name"] <-   "time_body_ajrk_std_Z"
column_list[228, "name"] <-  "time_body_ajrk_std_M"

column_list[121, "name"] <-  "time_body_gyro_mean_X"
column_list[122, "name"] <-  "time_body_gyro_mean_Y"
column_list[123, "name"] <-  "time_body_gyro_mean_Z"
column_list[240, "name"] <-  "time_body_gyro_mean_M"

column_list[124, "name"] <-  "time_body_gyro_std_X"
column_list[125, "name"] <-  "time_body_gyro_std_Y"
column_list[126, "name"] <-  "time_body_gyro_std_Z"
column_list[241, "name"] <-  "time_body_gyro_std_M"

column_list[161, "name"] <-  "time_body_gjrk_mean_X"
column_list[162, "name"] <-  "time_body_gjrk_mean_Y"
column_list[163, "name"] <-  "time_body_gjrk_mean_Z"
column_list[253, "name"] <-  "time_body_gjrk_mean_M"

column_list[164, "name"] <-  "time_body_gjrk_std_X"
column_list[165, "name"] <-  "time_body_gjrk_std_Y"
column_list[166, "name"] <-  "time_body_gjrk_std_Z"
column_list[254, "name"] <-  "time_body_gjrk_std_M"

column_list[41, "name"] <-   "time_grav_accl_mean_X"
column_list[42, "name"] <-   "time_grav_accl_mean_Y"
column_list[43, "name"] <-   "time_grav_accl_mean_Z"
column_list[214, "name"] <-  "time_grav_accl_mean_M"

column_list[44, "name"] <-   "time_grav_accl_std_X"
column_list[45, "name"] <-   "time_grav_accl_std_Y"
column_list[46, "name"] <-   "time_grav_accl_std_Z"
column_list[215, "name"] <-  "time_grav_accl_std_M"


column_list[266, "name"] <- "freq_body_accl_mean_X"
column_list[267, "name"] <- "freq_body_accl_mean_Y"
column_list[268, "name"] <- "freq_body_accl_mean_Z"
column_list[503, "name"] <- "freq_body_accl_mean_M"

column_list[269, "name"] <- "freq_body_accl_std_X"
column_list[270, "name"] <- "freq_body_accl_std_Y"
column_list[271, "name"] <- "freq_body_accl_std_Z"
column_list[504, "name"] <- "freq_body_accl_std_M"

column_list[294, "name"] <- "freq_body_accl_meanFreq_X"
column_list[295, "name"] <- "freq_body_accl_meanFreq_Y"
column_list[296, "name"] <- "freq_body_accl_meanFreq_Z"

column_list[345, "name"] <- "freq_body_ajrk_mean_X"
column_list[346, "name"] <- "freq_body_ajrk_mean_Y"
column_list[347, "name"] <- "freq_body_ajrk_mean_Z"
column_list[516, "name"] <- "freq_body_ajrk_mean_M"

column_list[348, "name"] <- "freq_body_ajrk_std_X"
column_list[349, "name"] <- "freq_body_ajrk_std_Y"
column_list[350, "name"] <- "freq_body_ajrk_std_Z"
column_list[517, "name"] <- "freq_body_ajrk_std_M"

column_list[373, "name"] <- "freq_body_ajrk_meanFreq_X"
column_list[374, "name"] <- "freq_body_ajrk_meanFreq_Y"
column_list[375, "name"] <- "freq_body_ajrk_meanFreq_Z"


column_list[424, "name"] <- "freq_body_gyro_mean_X"
column_list[425, "name"] <- "freq_body_gyro_mean_Y"
column_list[426, "name"] <- "freq_body_gyro_mean_Z"
column_list[529, "name"] <- "freq_body_gyro_mean_M"

column_list[427, "name"] <- "freq_body_gyro_std_X"
column_list[428, "name"] <- "freq_body_gyro_std_Y"
column_list[429, "name"] <- "freq_body_gyro_std_Z"
column_list[530, "name"] <- "freq_body_gyro_std_M"

column_list[542, "name"] <- "freq_body_gjrk_mean_M"
column_list[543, "name"] <- "freq_body_gjrk_std_M"


column_list[555, "name"] <- "angle_time_body_accl_mean_gravity"
column_list[556, "name"] <- "angle_time_body_ajrk_mean_gravity_mean"
column_list[557, "name"] <- "angle_time_body_gyro_mean_gravity_mean"
column_list[558, "name"] <- "angle_time_body_gjrk_mean_gravity_mean"
column_list[559, "name"] <- "angle_X_gravityMean"
column_list[560, "name"] <- "angle_Y_gravityMean"
column_list[561, "name"] <- "angle_Z_gravityMean"

# Set "keep" entry for all non-na columns
na_mask = is.na(column_list[,"name"])
column_list[,"keep"] = ifelse(na_mask, FALSE, TRUE)


# This code parses the features.txt file and keeps all columns/features with "mean" or "std"
# in their names. This code does not however rename the features to satisfy requirement #4:
#   "Appropriately labels the data set with descriptive variable names"

##  READ FEATURES FILE
# column_list <- read.table(".//UCI HAR Dataset/features.txt",
#                           colClasses=c(NULL, "character"),
#                           nrow=561,
#                           col.names=c("index", "name"))
# 
# ##  CONDITION FEATURE NAMES
# column_list[,"name"] <- make.names(column_list[,"name"], unique=TRUE)
# 
# ##  EXCLUDE IRRELEVANT FEATURES
# # Set names of features not containing "mean" or "std" to NULL
# keep_cols <- grepl("mean|std", column_list[,"name"], ignore.case=TRUE)
# column_list[,"keep"] <- keep_cols
