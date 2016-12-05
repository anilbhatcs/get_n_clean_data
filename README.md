==================================================================
Tidying the Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
The R script run_analysis.R reads the test and training data sets for Human Activity Recognition Using Smartphones, and creates a tidy data in the file set activity_averages.txt. The tidy data set contains the averages of various measures. More information is available in run_analysis.md.

To read the tidy data set, you may use the read.file() function.
Example: tidy_data <- read.table("<file path>/activity_averages.txt", header = TRUE)

Read the features_info.txt and features.txt for more information on the measures available in the original test and training data sets. The tidy data set contains just the required mean and standard deviation columns averaged by Subject and Activity. Note that the Activity column contains descriptive values. The column (variable) names in the tidy data set are the same as in the original test and training data sets.