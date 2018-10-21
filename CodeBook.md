## Procedure description on how tidy data sets is being created

1.  Download the dataset from the given URL and unzip them.
2.	Import the activity labels and features from 'activity_labels.txt' and 'features.txt' into variables ‘activity_labels’ and ‘features’. 
3.	Select only mean and standard deviation from variable ‘features’ using ‘grep’ function, and assign to variable ‘features_need’.
4.	Load the test data and train data which are in .txt format and assign each to specific variables
5.	Use function ‘cbind’ to combine ‘subject_train’, ‘label_train’ and ‘data_train_need’ to form a complete train set and assign to variable 'final_train'. This process is repeated for test data as well.
6.	Then, function ‘rbind’ is used to merge “train” and “test” data to form a complete set of data including train and test and assign to variable named as 'merged_data'.
7.	Function ‘gsub’ is then used to replace ‘-‘ with ‘_’ and omit ‘()’ in column 2 of “features_need”. This step is to set descriptive label on the column names of the merged_data.
8.	Since activity_labels got 6 factor, name it with descriptive activity names by using function 'factor'.
9.	To take the average of each variable in “merged_data” for each activity and each subject, ‘aggregate’ function is used with FUN = mean and get a new tidy data set ‘newdata’. Rename the first two columns of ‘newdata’ to ‘subject’ and ‘activity’.  

## Descriptions of new variables

activity_labels: list of class labels with its activity name
features: list of features
features_need: feactures containing mean and standard deviation

data_x_train: training set data
data_y_train: training labels data
subject_train: row identifier of the subject who performed the activity for train set data
data_x_test：test set data
data_y_test: test labels data
subject_test: row identifier of the subject who performed the activity for test set data

data_x_train_req: training set data with data containing of only mean and standard deviation
data_x_test_req: test set data with data containing of only mean and standard deviation


final_train: complete train set data with subject and activity
final_test: complete test set data with subject and activity
merged_data: merged train and test data

newedata: tidy data set with the average of each variable for each activity and each subject
