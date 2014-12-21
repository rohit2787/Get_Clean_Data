Getting and Cleaning Data
==============
The code described in run_analysis.R in this repository is used for extracting data from the Samsung data on wearable computing. The link to the data is given below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The code will only run if the zip folder "Samsung Data" which is downloaded using the same code is saved to the workspace.
The purpose of the code is to extract data for test and training of individuals while wearing the Samsung Galaxy S II on their waist. The experiments were conducted on 30 individuals each in 5 different activity modes (such as Walking, Walking Up, Sitting etc.).

The code extracts the various all the files from the zip folders, reads the relevant .txt files and combines the test and training data sets into one unified data set. A post-processing is carried out to obtain the averages of each variable for each subject-activity category.

Please refer to the code-book for additional details regarding variable names and types.
