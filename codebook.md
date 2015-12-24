# Codebook
This file describes the processes undertaken to process the input dataset and output a tidy dataset. It is assumed that the reader has access to the original dataset and has read the README.txt and features_info.txt files therein.

##  Tidy Dataset Format
The output tidy dataset contains 81 variables representing means and standard deviations of various derivatives of accelerometer measurements as well as participant and activity indices. For more information on the accelerometer data and it's collection, please see the original dataset's README.txt. A total of 180 entries are contained in rows and represent one entry for each activity per each participant for a total of six activities per each of 30 participants, or 180 entries. Within each entry, 79 variables capture various means and standard deviations of accelerometer data (and values derived from it.) These variables follow the naming convention:

  [Angle_]<Domain>_<Component>_<Metric>_<Measure>_<Dimension>

where each field is given by:

* Angle: Optional argument denoting measurement of angle (versus individual dimensions)
* Domain: One of "time" or "freq" denoting time or frequency domain inforamtion
* Component: One of "body" or "grav" denotin the body acceleration or (baseline) gravitational acceleration
* Metric: Measured component- one of "accl" (acceleration), "ajrk" (jerk, da/dt), "gyro" (gyroscope), "gjrk" (gyro "jerk", d3theta/dt3)
* Measure: One of "mean" or "std" (standard deviation)
* Dimension: One of "X", "Y", "Z", or "M" (magnitude)

Some exceptions to this naming convention exist and can be traced to the README.txt file in the original data set.



##  Retained Portions of the Original Dataset
Only the columns of the original dataset that include the terms "mean" or "std" (standard deviation) are included in the tidy set.



##  Processing Mechanics
The original dataset is processed in stages:
1. Load training data
2. Load test data
3. Concatenate datasets
4. Calculate mean for each participant, activity combination

Each of these stages are discussed in more detail below:

Before loading any data, the column names and activity names are loaded as well as a master list of columns from the full data set to keep from the  The participant indices, activity indices, and measured data are read in as numeric or integer values from the first 7352 rows from files "subject_train.txt", "y_train.txt", and "X_train.txt", respectively. The columns that don't include reference to a mean or standard deviation are removed from the data, and the appropriate participant and activity indices are inserted into the data and factorized.
Next the test data is loaded using the same process but with the appropriate files, and concatenated with the training data. Finally, the mean is calculated for each participant-activity permutation using the aggregate command and the resulting dataset is written to a text file.




