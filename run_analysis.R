##Download dataset from the website and unzip it

filename <- "dataset_given.zip"
if (!file.exists(filename))
{
	furl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(furl, filename)
}
if( !file.exists("UCI HAR Dataset"))
{
	unzip(filename)
}

##load all the required information data either test or train

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
features_need <- features[grep("mean()|std()",features[,2]),]

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
data_x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
data_y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
data_x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
data_y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

##load the required need features of test and train data

data_x_test_req <- data_x_test[,as.numeric(features_need[,1])]
data_x_train_req <- data_x_train[,as.numeric(features_need[,1])]

##Combine data_x_test with its required feature, and subject

final_test <- cbind(subject_test, data_y_test, data_x_test_req)

##Combine data_x_train with its required feature, and subject

final_train <- cbind(subject_train, data_y_train, data_x_train_req)

##Merge train and test data

merged_data <- rbind(final_train,final_test)

##Rename the label names with descriptive variable names by replacing "-" to "_"
## and also omitting "()"

features_need[,2] <- gsub("-", "_", features_need[,2])
features_need[,2] <- gsub("[()]", "", features_need[,2])
colnames(merged_data) <- c("subject", "activity", features_need[,2])

## Since activity got 6 factor, name it with descriptive activity names
merged_data$activity <- factor(merged_data$activity, levels = activity_labels[,1], labels = activity_labels[,2])

#creates a tidy data set with the average of each variable for each activity and each subject
newdata <-aggregate(merged_data[, 3:ncol(merged_data)], by=list(merged_data$subject,merged_data$activity), FUN=mean, na.rm=TRUE)
colnames(newdata) [1:2]<- c("subject", "activity") 
write.table(newdata, file="newdata.txt", row.names = FALSE)









