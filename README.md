# getting_and_cleaning_data


The file run_analysis.R contains two functions intended to be executed by the user:

1. main(): The funtion main reads all necessary textfiles, assuming these can be found in the working directory, and returns a dataframe processed through the points below.

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 

2. group_means(x), where x is a data frame returned by the function main() described above. group_means(x) returns a table with the average of each variable for each activity and each subject.

The other functions in run_analysis.R are called by the main-function to create the first tidy dataset:

The function file_to_df() reads the text files with the data into data frames.

The function make_df calls file_to_df and the merges the data frames into one large data frame.

The function label_rows_columns adds column names read from featues.txt. It also adds the column "Activity" giving information about the activity for each record.

The function mean_std extracts only columns with the subsrtings "mean" and "std" present in the column names.

The function identify_subjects adds column Activity_subject, with a separate value for each activity/subject combination.

The function tidy_colnames changes the colnames into all lower case and removes characters such as "- () _"

The function make_numeric converts all number values into numeric format.


