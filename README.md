# JH_GCD_Project_1
Repo for Coursera Johns Hopkins Getting and Cleaning Data Course

##  Overview
This repo contains the files necessary to produce a tidy dataset for the Coursera course "Getting and Cleaning Data" as part of the "Data Science" specialization; More particularly, this repo cleans a dataset containing metrics extracted from data collected by the IMU onboard a smartphone while participants engaged in various activities. Herein, three R scripts (a) clean input data from a zip file, (b) aggregate the mean of the data by participant and exercise activity, and (c) save the resulting tidy dataset to a txt file. These process elements are described in greater detail in the codebook.md file included. The files in this repro are:

###  File Descriptions
This repository includes six files:
1. aux_activities_master.R
2. aux_columns_master.R
3. codebook.md
4. GCD_Proj1_Tidy.txt
5. getdata_projectfiles_UCI HAR Dataset.zip
6. README.md
7. run_analysis.R

AUX_ACTIVITIES_MASTER.R and AUX_COLUMNS_MASTER.R are called by RUN_ANALYSIS.R to load the activity names and metrics' names, respectively.

CODEBOOK.MD is a codebook describing the alterations made to the original dataset in order to produce a tidy dataset.

GCD_PROJ1_TIDY.TXT is the output tidy dataset, as written by R:
    write.table(..., row.names=FALSE)

GETDATA_PROJECTFILES_UCI HAR DATASET.ZIP is the original dataset, zipped.

README.md is this file.

RUN_ANALYSIS.R is the entry point for the tidy dataset production.