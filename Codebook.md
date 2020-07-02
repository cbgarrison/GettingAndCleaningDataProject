# Code book for the Getting and Cleaning Data course project

Background information on this data set can be found in the README.md in this repository

This code book pertains to the final_tidy_data.txt file in this repository

## Data Transformation from raw to tidy

The raw data was obtained on July 1, 2020 and was transformed by:

1. Merging the training and the test sets to create one data set

2. Extracting the measurements on the mean and standard deviation for each measurement

3. Use descriptive activity names to name the activities in the data set

4. Appropriately label the data set with descriptive variable names

5. From the data set derived from step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

## Variables in R code

subjectID is the subject identifier, in the form of an integer, with numbers that range from 1 to 30

code is the activity identifier, which is a string with 6 possible values related to the movement and position of the subject

features is the variable used for the features.txt file

activitys is the variable used for the activity_labels.txt file

xtrain is the variable used for the X_train.txt file

ytrain is the variable used for the y_train.txt file

subjecttrain is the variable used for the subject_train.txt file

xtest is the variable used for the X_test.txt file

ytest is the variable used for the y_test.txt file

subjecttest is the variable used for the subject_train.txt file

Xmerge is the variable representing the merging of the xtrain and xtest data

Ymerge is the variable representing the merging of the ytrain and ytest data

subjectmerge is the variable representing the merging of the subjecttrain and subjecttest data

merged_data is the variable representing the merging of the Xmerge, Ymerge, and
subjectmerge data

final_tidy_data is the variable for the completed tidy dataset


