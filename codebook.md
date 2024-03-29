The functions in the script read the text files that contain the data values, the names of the variables, the activity names and the subject numbers.

To get the values into a data frame, the script reads the files with the readLines Command. This produces a list of character strings, one for each record.

With the split command, those strings are split into vectors, separating the values into ito individual strings. These strings are then converted to the numeric format.

The columns are named using the data from features.txt. Columns whose names ddo not contain "mean" or "std" are removed.

Strings with activity numbers are added to the table, and the numbers are replaced with the corresponding activity name (such as standing, walking). A new column is created with a separate value for each activity/subject combo. Using this activity/subject variable the mean for each combo is produced and stored in the second tidy table.

Variable Names
1 Subject_activity
1 Subject
1 Activity
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
201 tBodyAccMag-mean()
214 tGravityAccMag-mean()
227 tBodyAccJerkMag-mean()
240 tBodyGyroMag-mean()
253 tBodyGyroJerkMag-mean()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
294 fBodyAcc-meanFreq()-X
295 fBodyAcc-meanFreq()-Y
296 fBodyAcc-meanFreq()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
373 fBodyAccJerk-meanFreq()-X
374 fBodyAccJerk-meanFreq()-Y
375 fBodyAccJerk-meanFreq()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
452 fBodyGyro-meanFreq()-X
453 fBodyGyro-meanFreq()-Y
454 fBodyGyro-meanFreq()-Z
503 fBodyAccMag-mean()
513 fBodyAccMag-meanFreq()
516 fBodyBodyAccJerkMag-mean()
526 fBodyBodyAccJerkMag-meanFreq()
529 fBodyBodyGyroMag-mean()
539 fBodyBodyGyroMag-meanFreq()
542 fBodyBodyGyroJerkMag-mean()
552 fBodyBodyGyroJerkMag-meanFreq()
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
202 tBodyAccMag-std()
215 tGravityAccMag-std()
228 tBodyAccJerkMag-std()
241 tBodyGyroMag-std()
254 tBodyGyroJerkMag-std()
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
504 fBodyAccMag-std()
517 fBodyBodyAccJerkMag-std()
530 fBodyBodyGyroMag-std()
543 fBodyBodyGyroJerkMag-std()
