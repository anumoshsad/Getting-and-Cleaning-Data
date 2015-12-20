## Getting-and-Cleaning-Data
Course project of making a tidy dataset. Explanation of run_analysis.R is as follows.

Keep the names of features in a vector feats.

Read the test data set in a data frame 'test'.

Then read the train data set in a data frame 'train'.

Attach the two data frames in a bigger data frame 'total' by rbind. 

Extracts only the measurements of mean and std error by using grepl function.

From 'total', make the data frame 'MS' with mean and std only. 

Name the activities properly. 

Use aggregate function to take the averages of each features for each activity and each subjects and put it in 'ANSWER'.

write the data frame 'ANSWER' in a text file "ANSWER.TXT"
