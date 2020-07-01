##make data folder
if(!file.exists("./data")) {
    dir.create("./data")
}

##download file to folder
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./data/Project.zip", method = "curl")

##unzip the downloaded file
unzip(zipfile = "./data/Project.zip", exdir = "./data")

##Assignment step 1: Merge the training and test sets to create one data set

##read in the feature vector and activity labels
features<-read.table("./data/UCI HAR Dataset/features.txt", col.names=c("n","functions"))
activitys<-read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("code","activity"))

##read in the training sets
xtrain<-read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names=features$functions)
ytrain<-read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names="code")
subjecttrain<-read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names="subjectID")

##read in the test sets
xtest<-read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names=features$functions)
ytest<-read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names="code")
subjecttest<-read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names="subjectID")

##merge training and testing sets into one set
Xmerge<-rbind(xtrain,xtest)
Ymerge<-rbind(ytrain,ytest)
subjectmerge<-rbind(subjecttrain,subjecttest)
merged_data<-cbind(subjectmerge,Ymerge,Xmerge)

##Assignment step 2: Extract only the measurements on the mean and SD for each measurement
selectedfeatures<-grepl("subjectID|code|mean|std", colnames(merged_data))
meanSDmeasurements<-merged_data[,selectedfeatures]

##Assignment step 3: Use descriptive activity names to name the activities in the data set
meanSDmeasurements$code<-activitys[meanSDmeasurements$code,2]

##Assignment step 4: Appropriately label the data set with descriptive variable names
names(meanSDmeasurements)[2]="activity"
names(meanSDmeasurements)<-gsub("Acc","Accelerometer",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("Gyro","Gyroscope",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("BodyBody","Body",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("Mag","Magnitude",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("tBody","TimeBody",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("^t","Time",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("^f","Frequency",names(meanSDmeasurements))
names(meanSDmeasurements)<-gsub("-mean()","mean",names(meanSDmeasurements),ignore.case = TRUE)
names(meanSDmeasurements)<-gsub("-freq()","Frequency",names(meanSDmeasurements),ignore.case = TRUE)
names(meanSDmeasurements)<-gsub("-std()","STD",names(meanSDmeasurements),ignore.case = TRUE)

##Assignment step 5: from step 4, create a second independent tidy data set with
##the average of each variable for each activity and subject
final_tidy_data<-aggregate(. ~subjectID + activity, meanSDmeasurements, mean)
final_tidy_data<-final_tidy_data[order(final_tidy_data$subjectID,final_tidy_data$activity),]

##write the second tidy dataset into a txt file
write.table(final_tidy_data, "final_tidy_data.txt", row.name = FALSE)