Getting and Cleaning Data
==============
The code described in run_analysis.R in this repository is used for extracting data from the Samsung data on wearable computing. The link to the data is given below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The code will only run if the zip folder "Samsung Data" which is downloaded using the same code is saved to the workspace.
The purpose of the code is to extract data for test and training of individuals while wearing the Samsung Galaxy S II on their waist. The experiments were conducted on 30 individuals each in 5 different activity modes (such as Walking, Walking Up, Sitting etc.).

The code extracts the various all the files from the zip folders, reads the relevant .txt files and combines the test and training data sets into one unified data set. A post-processing is carried out to obtain the averages of each variable for each subject-activity category. The following steps briefly describe the code:

1. Read files features.txt and activity_labels.txt and save them in separate data frames.
2. Creat a logical vector that identifies the features that include 'mean' or 'std' in them.
3. Read files X_test and use the data obtained from features.txt to give variable names. Reduce the data frame by applying the logical vector created in step 2 over the columns of this dataframe.
4. Read files y_test and subject_test into 2 separate data frames
5. Combine data frames created in step 3 and 4 using cbind() to create a data frame for the test data.
6. Repeat the steps 3 and 4 for the train data set.
7. Combine a complete data set using rbind() over both test and train data sets.
8. Using factors in activity_labels data frame replace the label number with the activity name in the unified data set.
9. Using melt and cast re-arrange the dataset to obtain average of each feature variable for each subject-activity combination.
10. write the final data.frame to a text file.

Please refer to the code-book for additional details regarding variable names and types.
