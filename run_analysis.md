# Getting and Cleaning Data Course Project

## Summary of steps executed by the script
The steps are as follows:

1. Load the libraries
2. Define file path constants
3. Read the code files
4. Read the test and training data sets
5. Merge the test and training data sets
6. Get the Activity label for each observation
7. Reshape the merged data
8. Create the tidy data set

## Detailed Design

### Load the library
Two libraries are used by this script:
* dplyr - Used to call the function join()
* reshape2 - Used to call functions melt() and dcast()

### Define the file path constants
The file path constants are used for forming the complete path and file name for reading all the files needed in this script

### Read the code files
There are two code files: 
* features.txt - Values from this file are used for assigning column names in the data set read from x_test.txt and x_train.txt
* activity_labels.txt - Values from this file are used to describe the Activity IDs in test and train data sets

### Read the test and training data sets
Reading the data sets consists of the following steps:
* Read the x, y, and subject files for the test data set using the read.table() function
* Merge the data read from the files using the cbind() function
    + It is assumed that all three files contain the same number of rows
    + While merging the data by their columns, the script passes only the required mean and standard deviation columns to the the function
* The above steps are repeated for the training data steps

Each resulting data set contains the Subject, Activity ID, and the required mean and standard deviation columns. Note that the Subject and Activity ID columns are named later in the script.

### Merge the test and training data sets
The script merges the test and training data sets using the rbind() function. It is assummed that the two data sets contain the same number of columns. The first two columns in the merged data set are named Subject and Activity ID.

### Get the Activity Label for each observation
The script calls the join() function to read the Activity Label (read from the file activity_labels.txt) into the merged data set

### Reshape the merged data
Given that there are 79 columns with mean and standard deviation measures in the merged data frame, the easiest way to perform any statistical operation on each of them is to melt down the measures into variable and value columns. In other words, the script calls the melt() function to reshape the merged data set into just four columns: * subject
* activity
* variable
* value 

Note that the activity ID is excluded. Instead the molten data frame uses the descriptive activity name.

### Create the tidy data set
The final objective of calculating the averages of each variable and creating a tidy data set is accomplished using the dcast() function. The tidy data set reshapes the molten data frame from the previous step back into a data frame containing the subject, activity and 79 columns of averages. The final tidy data set is written out to a file called activity_averages.txt.