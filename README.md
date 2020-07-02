# Coursera Getting and Cleaning Data Project
This README will cover the peer-graded project for the Getting and Cleaning Data Course on Coursera.

# Assignment:
"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!"

# Repository
This repository contains the following files:

README.md - the file currently being read, describing the data and the files created

run_analysis.R - the R script used to transform the raw data from the zip file listed above to tidy data

final_tidy_data.txt - the tidy dataset that was generated using the run_analysis.R code

Codebook.md - the code book for the run_analysis.R script

# R Script (run_analysis.R)
The R script in this repository can be used to:
1. Download the project raw dataset
2. Read in the activity, subject, test datasets, and training datasets
3. Merge the test and training datasets into one
4. Parse out only the mean and standard deviations of the measurements taken
5. Alter the activity names to be descriptive
6. Alter the labels in the data set to be more descriptive where needed
7. Output a tidy data set (final_tidy_data.txt) that contains the average of each variable for each activity and subject

